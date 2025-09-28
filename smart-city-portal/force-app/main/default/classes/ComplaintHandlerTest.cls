@isTest
public class ComplaintHandlerTest {
    @isTest static void testCreateComplaint() {
        Department__c dept = new Department__c(Name = 'Roads');
        insert dept;

        Test.startTest();
        Id compId = ComplaintHandler.createComplaint(
            'Alice Citizen',
            'alice@test.com',
            '9876543210',
            dept.Id,
            'Pothole on Main Street',
            'High'
        );
        Test.stopTest();

        Complaint__c insertedComp = [SELECT Id, Status__c, Department__c FROM Complaint__c WHERE Id = :compId];
        System.assertEquals('New', insertedComp.Status__c, 'Complaint should be created with status New');
        System.assertEquals(dept.Id, insertedComp.Department__c, 'Department should be linked correctly');
    }
}
