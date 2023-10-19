public class ContactSearch {
    
    public static List<Contact> searchForContacts(String lastName, String mailingPostalCode) {
        
        List<Contact> contacts = [select id, firstname, lastname, MailingPostalCode from contact where MailingPostalCode =: mailingPostalCode and lastname =: lastName];
        return contacts;
        
    }
    
}