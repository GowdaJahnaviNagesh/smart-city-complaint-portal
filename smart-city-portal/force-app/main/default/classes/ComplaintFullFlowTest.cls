@isTest
public class ComplaintFullFlowTest {
    @isTest
    static void testComplaintLifecycle() {
        // Insert High Priority Complaint → should escalate
        Complaint__c highComp = new Complaint__c(
            Name = 'High Priority Test',
            Citizen_Name__c = 'Test User',
            Citizen_Email__c = 'test1@example.com',
            Citizen_Phone__c = '1111111111',
            Priority__c = 'High',
            Status__c = 'New'
        );
        insert highComp;

        // Insert Low Priority Complaint → normal
        Complaint__c lowComp = new Complaint__c(
        Name= 'Low Priority Test',
            Citizen_Name__c = 'Test User2',
            Citizen_Email__c = 'test2@example.com',
            Citizen_Phone__c = '2222222222',
            Priority__c = 'Low',
            Status__c = 'New'
        );
        insert lowComp;

        // Update Status flow
        highComp.Status__c = 'In Progress';
        update highComp;

        highComp.Status__c = 'Resolved';
        update highComp;

        highComp.Status__c = 'Closed';
        update highComp;

        // Call Future method (ComplaintNotifier)
        Test.startTest();
        ComplaintNotifier.notifyCitizen(highComp.Id);
        System.enqueueJob(new UrgentComplaintQueueable());
        System.schedule('Test Schedule', '0 0 0 * * ?', new ComplaintScheduler());
        Test.stopTest();

        // Feedback creation
        Id fbId = FeedbackHandler.createFeedback(highComp.Id, 5, 'Excellent');
        Feedback__c fb = [SELECT Rating__c, Comments__c FROM Feedback__c WHERE Id = :fbId];
        System.assertEquals(5, fb.Rating__c);
        System.assertEquals('Excellent', fb.Comments__c);

        // Re-query complaints
        Complaint__c checkComp = [SELECT Status__c, Priority__c FROM Complaint__c WHERE Id = :highComp.Id];
        System.assertNotEquals(null, checkComp.Status__c);
    }

    @isTest
    static void testValidationRule() {
        // Expect validation failure if missing Priority
        Complaint__c comp = new Complaint__c(
            Name= 'Invalid Complaint',
            Citizen_Name__c = 'No Priority',
            Citizen_Email__c = 'nopriority@test.com',
            Citizen_Phone__c = '9999999999',
            Status__c = 'New'
        );

        try {
            insert comp;
            System.assert(false, 'Expected validation error but insert succeeded');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Priority'), 'Should fail due to Priority missing');
        }
    }
}
