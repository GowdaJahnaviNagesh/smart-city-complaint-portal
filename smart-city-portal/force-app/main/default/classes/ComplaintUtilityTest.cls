@isTest
private class ComplaintUtilityTest {

    @isTest
    static void testQueueable() {
        Complaint__c comp = new Complaint__c(
            Complaint_Name__c = 'Water Issue',
            Citizen_Name__c = 'John',
            Citizen_Email__c = 'john@test.com',
            Citizen_Phone__c = '12345',
            Priority__c = 'Critical',
            Status__c = 'New'
        );
        insert comp;

        Test.startTest();
        System.enqueueJob(new UrgentComplaintQueueable());
        Test.stopTest();

        comp = [SELECT Status__c FROM Complaint__c WHERE Id = :comp.Id];
        System.assertEquals('Escalated', comp.Status__c);
    }

    @isTest
    static void testBatch() {
        List<Complaint__c> complaints = new List<Complaint__c>();
        for (Integer i = 0; i < 5; i++) {
            complaints.add(new Complaint__c(
                Complaint_Name__c = 'Test ' + i,
                Citizen_Name__c = 'Test User',
                Citizen_Email__c = 'user@test.com',
                Citizen_Phone__c = '12345',
                Priority__c = 'Low',
                Status__c = 'New',
                SLA_Due_Date__c = Date.today().addDays(-1) // expired
            ));
        }
        insert complaints;

        Test.startTest();
        Database.executeBatch(new ComplaintBatch(), 50);
        Test.stopTest();

        Integer escalatedCount = [SELECT COUNT() FROM Complaint__c WHERE Status__c = 'Escalated'];
        System.assert(escalatedCount > 0);
    }
}
