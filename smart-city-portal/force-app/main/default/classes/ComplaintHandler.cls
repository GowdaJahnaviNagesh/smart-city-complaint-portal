public with sharing class ComplaintHandler {

    // ✅ Fetch all Departments for combobox
    @AuraEnabled(cacheable=true)
    public static List<Department__c> getDepartments() {
        return [SELECT Id, Name FROM Department__c];
    }

    // ✅ Create Complaint and link to Department (Lookup Id)
    @AuraEnabled
    public static Id createComplaint(
        String citizenName,
        String email,
        String phone,
        Id departmentId,     // now accepts Department Id
        String description,
        String priority
    ) {
        // Fetch department name for SLA lookup
        String departmentName = '';
        if (departmentId != null) {
            Department__c dept = [SELECT Name FROM Department__c WHERE Id = :departmentId LIMIT 1];
            departmentName = dept.Name;
        }

        // Query SLA Config metadata
        List<SLA_Config__mdt> configs = [
            SELECT Department__c, Priority__c, SLA_Days__c 
            FROM SLA_Config__mdt 
            WHERE Department__c = :departmentName 
            AND Priority__c = :priority
            LIMIT 1
        ];

        Integer slaDays = configs.isEmpty() ? 7 : (Integer)configs[0].SLA_Days__c;

        // Create complaint record
        Complaint__c comp = new Complaint__c();
        comp.Citizen_Name__c = citizenName;
        comp.Citizen_Email__c = email;
        comp.Citizen_Phone__c = phone;
        comp.Department__c = departmentId;   // lookup assignment
        comp.Description__c = description;
        comp.Priority__c = priority;
        comp.Status__c = 'New';
        comp.SLA_Due_Date__c = Date.today().addDays(slaDays);

        insert comp;
        return comp.Id;
    }
}
