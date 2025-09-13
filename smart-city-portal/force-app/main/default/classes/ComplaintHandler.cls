public with sharing class ComplaintHandler {
    @AuraEnabled
    public static Id createComplaint(
        String citizenName,
        String email,
        String phone,
        String department,
        String description,
        String priority
    ) {
        Complaint__c comp = new Complaint__c();
        comp.Citizen_Name__c = citizenName;
        comp.Citizen_Email__c = email;
        comp.Citizen_Phone__c = phone;
        comp.Department__c = department;
        comp.Description__c = description;
        comp.Priority__c = priority;
        comp.Status__c = 'New';
        comp.SLA_Due_Date__c = Date.today().addDays(7);
        insert comp;
        return comp.Id;
    }
}
