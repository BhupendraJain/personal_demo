public class AccountHandler {
    
    public static Account insertNewAccount(String accName) {
        
        try {
            
            Account acc = new Account(Name = accName);
            insert acc;
            System.debug('Account object is: ' + acc);
            return acc;
            
        } catch(DmlException e) {
            
            System.debug('DmlException occurred while creating new account : ' + e.getMessage());
            return null;
         }


    }
    
}