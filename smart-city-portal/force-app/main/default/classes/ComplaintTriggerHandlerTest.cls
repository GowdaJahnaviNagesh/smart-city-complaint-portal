@isTest
public class ComplaintTriggerHandlerTest {
    @isTest static void testTriggerInsert() {
        Complaint__c comp = new Complaint__c(
            Name = 'Road Issue',
            Citizen_Name__c = 'Alice',
            Citizen_Email__c = 'alice@test.com',
            Citizen_Phone__c = '99999',
            Priority__c = 'High',
            Status__c = 'New'
        );
        insert comp;

        Complaint__c insertedComp = [SELECT Id, Status__c FROM Complaint__c WHERE Id = :comp.Id];
        System.assertEquals('New', insertedComp.Status__c);
    }

    @isTest static void testTriggerUpdate() {
        Complaint__c comp = new Complaint__c(
            Name = 'Water Issue',
            Citizen_Name__c = 'Bob',
            Citizen_Email__c = 'bob@test.com',
            Citizen_Phone__c = '11111',
            Priority__c = 'Critical',
            Status__c = 'In Progress'
        );
        insert comp;

        comp.Status__c = 'Resolved';
        update comp;

        Complaint__c updatedComp = [SELECT Status__c FROM Complaint__c WHERE Id = :comp.Id];
        System.assertEquals('Resolved', updatedComp.Status__c);
    }
}
