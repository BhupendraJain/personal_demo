public class SearchAccountInterview2Controller {

    private ApexPages.StandardController controller {get; set;}

    public string EnteredString{get; set;}
    public List<account> AccList{get; set;}
    
    public SearchAccountInterview2Controller(Apexpages.StandardController getRecord)
    {
       controller = getRecord;
    }
    
    public String getAccounts() {
        return null;
    }
    
   
    public PageReference findTasks() {
        
        if(EnteredString == null || EnteredString.trim().length() == 0)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Please enter Account Search Criteria'));
//            return null;
        }
        
        String Query = 'SELECT id, Name ,BillingState, Phone, Website From Account Where Name LIKE \'%'+ EnteredString +'%\'';
        AccList = Database.query(query);
        if(accList.size() == 0)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'No results found for search criteria : ' + EnteredString));
        }
        return null;
    }

}