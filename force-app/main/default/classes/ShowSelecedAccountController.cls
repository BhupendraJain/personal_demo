public class ShowSelecedAccountController{

public String selAccountName{get; set;}

    public void selectAcc() {
        //selAccountName = System.currentPagereference().getParameters().get('AccName');
        System.debug('selAccountName: '+selAccountName);
        Account Acc = [select Id, Name, BillingState, Website, Phone from Account where Name=:selAccountName];
        System.debug('Acc.Name : ' + Acc.Name);
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Account :  \'' + Acc.Name + '\'  was selected'));
    }


    public List<Account> AccountsList{get;set;}
    public String selectedAccountName{get; set;}
    
    public ShowSelecedAccountController(){
        if(AccountsList == null) {
            AccountsList = new List<Account>();
            for(Account a: [select Id, Name, BillingState, Website, Phone from Account limit 100]) {
                AccountsList.add(a);
            }
        }
    }
    
    public void processSelected() {
    
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'You selected : ' + selectedAccountName));

//        for(Account AccountObj : AccountsList) {
//            if(AccountObj.Name.equals(selectedAccountName)) {
//                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'You selected : ' + selectedAccountName));
//            }
//        }
    }
}