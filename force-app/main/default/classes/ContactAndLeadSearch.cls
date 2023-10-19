public class ContactAndLeadSearch {
    
    public static List<List< SObject>> searchContactsAndLeads(String searchStr) {
        
        List<List< SObject>> searchList = [FIND :searchStr IN ALL FIELDS 
            RETURNING contact(FirstName, LastName WHERE FirstName = :searchstr OR LastName = :searchstr ),
            lead(FirstName, LastName WHERE FirstName = :searchstr OR LastName = :searchstr )];
        
        return searchList;
    }
    
}