public with sharing class FeedbackHandler {
    @AuraEnabled
    public static Id createFeedback(Id complaintId, Integer rating, String comments) {
        Feedback__c fb = new Feedback__c();
        fb.Complaint__c = complaintId;
        fb.Rating__c = rating;
        fb.Comments__c = comments;
        insert fb;
        return fb.Id;
    }
}
