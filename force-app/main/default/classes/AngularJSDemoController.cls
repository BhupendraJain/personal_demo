public with sharing class AngularJSDemoController{ 
    
    public String AccountList { get; set; }
    
    //Subclass : Wrapper Class 
    public class Accountwrap {
        //Static Variables 
        public string id;
        public string name;
        public string Phone;
        
        //Wrapper  Class Controller
        Accountwrap() {
            Phone = '';
        }
        
    }
       
    //Method to bring the list of Account and Serialize Wrapper Object as JSON
    public  static String getlstAccount() {
        List <Accountwrap> accountWraps = new List <Accountwrap> ();
        List <account> accounts = [SELECT 
                                        Id
                                        , Name
                                        , Phone
                                    FROM 
                                        Account 
                                    limit 100
                                  ];
        for (Account account: accounts ) {
            Accountwrap accountWrap = new Accountwrap();
            accountWrap.id = account.id;
            accountWrap.name = account.name;
            if (account.Phone != null) {
                accountWrap.Phone = account.Phone;
            }
            accountWraps.add(accountWrap);
        }
        return JSON.serialize(accountWraps);
     }
    
}