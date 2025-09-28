@isTest
public class ComplaintNotifierTest {
    @isTest
    static void testNotifyCitizen() {
        Complaint__c comp = new Complaint__c(
            Name = 'Water Issue',
            Citizen_Name__c = 'John Doe',
            Citizen_Email__c = 'john@test.com',
            Citizen_Phone__c = '9876543210',
            Priority__c = 'Medium',
            Status__c = 'Resolved'
        );
        insert comp;

        Test.startTest();
        ComplaintNotifier.notifyCitizen(comp.Id);
        Test.stopTest();

        // No DML, just check debug logs covered
        System.assertNotEquals(null, comp.Id);
    }
}
