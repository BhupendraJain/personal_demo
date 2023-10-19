public class RadioButton {
List<Account> selectAcc;
Public List<Account> getAllAccounts()
{
    List<Account> allAcc = [select Id, Name, BillingState, Website, Phone from Account limit 100];
    return allAcc;
}    
Public void selectAcc()
{
    String selAccountid = System.currentPagereference().getParameters().get('accId');
    Account Acc = [select Id, Name, BillingState, Website, Phone from Account where Id=:selAccountid];
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Account :  \'' + Acc.Name + '\'  was selected'));
    selectAcc =  new List<Account>();
    selectAcc.add(Acc);
}
Public List<Account> getselectedAccount()
{
    return selectAcc;
}
}