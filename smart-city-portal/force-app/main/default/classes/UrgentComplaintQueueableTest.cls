@isTest
public class UrgentComplaintQueueableTest {
    @isTest
    static void testQueueableEscalation() {
        Complaint__c comp = new Complaint__c(
            Name = 'Power Failure',
            Citizen_Name__c = 'Alice',
            Citizen_Email__c = 'alice@test.com',
            Citizen_Phone__c = '1112223333',
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
}
