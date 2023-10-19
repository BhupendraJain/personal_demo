public class APTS_BJ_ContactsList_Ctrl {
    
    public List<Contact> getContacts() {
        
        List<Contact> results = Database.query ('SELECT Id, FirstName, LastName, Title, Email from Contact LIMIT 10');
        
        return results;
        
    }
    
}