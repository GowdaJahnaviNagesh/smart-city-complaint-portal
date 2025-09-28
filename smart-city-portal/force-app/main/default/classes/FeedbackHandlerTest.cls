@isTest
public class FeedbackHandlerTest {
    @isTest
    static void testFeedbackCreation() {
        Complaint__c comp = new Complaint__c(
            Name = 'Garbage Issue',
            Citizen_Name__c = 'Bob',
            Citizen_Email__c = 'bob@test.com',
            Citizen_Phone__c = '5556667777',
            Priority__c = 'Low',
            Status__c = 'Resolved'
        );
        insert comp;

        Test.startTest();
        Id fbId = FeedbackHandler.createFeedback(comp.Id, 4, 'Good response');
        Test.stopTest();

        Feedback__c fb = [SELECT Rating__c, Comments__c FROM Feedback__c WHERE Id = :fbId];
        System.assertEquals(4, fb.Rating__c);
        System.assertEquals('Good response', fb.Comments__c);
    }
}
