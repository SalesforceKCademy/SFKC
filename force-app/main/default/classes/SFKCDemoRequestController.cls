public with sharing class SFKCDemoRequestController {
    public SFKCDemoRequestController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<String> getCoursePicklistValues() {
        List<String> picklistValues = new List<String>();
        Schema.DescribeFieldResult fieldResult = Demo_Request__c.Course__c.getDescribe();
        List<Schema.PicklistEntry> picklistEntries = fieldResult.getPicklistValues();
        
        for(Schema.PicklistEntry entry : picklistEntries) {
            picklistValues.add(entry.getLabel());
        }
        
        return picklistValues;
    }

    @AuraEnabled
    public static String createDemoRequest(Map<String, Object> fields) {
        Demo_Request__c demoRequest = new Demo_Request__c();
        if(fields.containsKey('Name')) demoRequest.Name = (String)fields.get('Name');
        if(fields.containsKey('Phone__c')) demoRequest.Phone__c = (String)fields.get('Phone__c');
        if(fields.containsKey('Course__c')) demoRequest.Course__c = (String)fields.get('Course__c');
        if(fields.containsKey('Questions__c')) demoRequest.Questions__c = (String)fields.get('Questions__c');
        
        try {
            insert demoRequest;
            return 'Success';
        } catch (Exception e) {
            throw new AuraHandledException('Error in submitting request: ' + e.getMessage());
        }
    }
}