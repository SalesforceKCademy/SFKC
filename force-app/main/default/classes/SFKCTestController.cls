public with sharing class SFKCTestController {
    public List<Question> questions { get; set; }
    public Boolean isSubmitted { get; set; }

    public SFKCTestController() {
        isSubmitted = true;
        questions = new List<Question>{
            new Question('What does CRM stand for?', new List<String>{'Customer Relationship Management', 'Customer Reliable Management', 'Client Relationship Management', 'Client Reliable Management'}),
            new Question('What type of software is Salesforce?', new List<String>{'On-premise', 'Cloud-based', 'Hybrid', 'Desktop'}),
            new Question('Which of the following is NOT a standard Salesforce object?', new List<String>{'Account', 'Contact', 'Order', 'Purchase'}),
            new Question('In Salesforce, a field can be of which type?', new List<String>{'Text', 'Number', 'Checkbox', 'All of the above'}),
            new Question('What is a record in Salesforce?', new List<String>{'A field', 'An object', 'An instance of an object', 'A list of objects'}),
            new Question('Which field type is used for auto-numbering in Salesforce?', new List<String>{'Text', 'Auto Number', 'Formula', 'Number'}),
            new Question('What type of relationship allows a child record to be related to only one parent record in Salesforce?', new List<String>{'Lookup', 'Master-Detail', 'Hierarchical', 'External Lookup'}),
            new Question('What is the maximum number of master-detail relationships per object in Salesforce?', new List<String>{'1', '2', '3', 'Unlimited'}),
            new Question('In Salesforce, what does SOQL stand for?', new List<String>{'Salesforce Object Query Language', 'Simple Object Query Language', 'Standard Object Query Language', 'Salesforce Organizational Query Language'}),
            new Question('Which of the following is NOT a type of field in Salesforce?', new List<String>{'Text', 'Number', 'Boolean', 'Date/Time'}),
            new Question('Which standard object represents individuals or companies in Salesforce?', new List<String>{'Contact', 'Account', 'Lead', 'Opportunity'}),
            new Question('What is the primary function of a Salesforce admin?', new List<String>{'Manage users and security', 'Develop custom applications', 'Integrate external systems', 'Create marketing campaigns'}),
            new Question('Which tool is used to import data into Salesforce?', new List<String>{'Data Loader', 'Data Import Wizard', 'Workbench', 'All of the above'}),
            new Question('What does the schema builder in Salesforce allow you to do?', new List<String>{'Create objects', 'Define relationships', 'View the data model', 'All of the above'}),
            new Question('Which field type is used for a unique identifier for each record in Salesforce?', new List<String>{'Text', 'Number', 'External ID', 'Auto Number'}),
            new Question('What is the main difference between a lookup relationship and a master-detail relationship in Salesforce?', new List<String>{'Lookup is optional, master-detail is mandatory', 'Lookup has no impact on sharing, master-detail does', 'Lookup can be one-to-many, master-detail cannot', 'All of the above'}),
            new Question('What is the maximum number of fields you can create per object in Salesforce?', new List<String>{'100', '200', '500', '800'}),
            new Question('What is the primary use of the Salesforce Lightning Experience?', new List<String>{'For mobile app development', 'For improved UI and performance', 'For integration with other systems', 'For CRM analytics'}),
            new Question('What is an Apex trigger used for in Salesforce?', new List<String>{'To create custom objects', 'To automate workflows', 'To execute custom code based on events', 'To define field dependencies'}),
            new Question('In SOQL, which clause is used to filter records?', new List<String>{'SELECT', 'FROM', 'WHERE', 'ORDER BY'}),
            new Question('Which object is used to represent potential sales in Salesforce?', new List<String>{'Account', 'Contact', 'Opportunity', 'Lead'}),
            new Question('What is a key feature of the Salesforce Service Cloud?', new List<String>{'Customer support and case management', 'Sales automation', 'Marketing automation', 'Data integration'}),
            new Question('Which Salesforce tool is used for collaborative development and version control?', new List<String>{'GitHub', 'Data Loader', 'Workbench', 'Change Sets'}),
            new Question('What does a Salesforce profile control?', new List<String>{'User interface settings', 'Field-level security', 'Object permissions', 'All of the above'}),
            new Question('Which Salesforce feature allows you to automate business processes?', new List<String>{'Workflow Rules', 'Process Builder', 'Flow', 'All of the above'}),
            new Question('What is the purpose of a Salesforce sandbox?', new List<String>{'To test new features and customizations', 'To store archived data', 'To host the main production data', 'To create backups'}),
            new Question('What does the Salesforce AppExchange provide?', new List<String>{'Custom applications', 'Consulting services', 'Integration tools', 'All of the above'}),
            new Question('What is the use of the Salesforce Chatter feature?', new List<String>{'Project management', 'Real-time collaboration and communication', 'Sales automation', 'Customer service'}),
            new Question('Which report type allows you to create a matrix with summary data?', new List<String>{'Tabular', 'Summary', 'Matrix', 'Joined'}),
            new Question('In a master-detail relationship, what happens when a parent record is deleted?', new List<String>{'Nothing', 'Child records are also deleted', 'Child records are reassigned', 'A warning is issued'})
        };
    }

    public PageReference submit() {
        String result = '';
        for(Integer i = 0; i < questions.size(); i++) {
            result += 'Question ' + (i + 1) + ': ' + questions[i].question + ' - Answer: ' + questions[i].selectedOption + '\n';
        }

        // Send email with the result
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new String[] {'salesforcekcademy@gmail.com'});
        email.setSubject('Test Results');
        email.setPlainTextBody(result);
        isSubmitted = false;
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});

        // Display a success message
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Your test has been submitted successfully.'));
        
        return null;
    }

    public class Question {
        public String question { get; set; }
        public List<SelectOption> options { get; set; }
        public String selectedOption { get; set; }

        public Question(String q, List<String> opts) {
            question = q;
            options = new List<SelectOption>();
            for (String opt : opts) {
                options.add(new SelectOption(opt, opt));
            }
            selectedOption = '';
        }
    }
}