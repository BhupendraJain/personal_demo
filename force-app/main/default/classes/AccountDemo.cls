public class AccountDemo {

    // Declaration and initialization of public static Integer classVar
    public static Integer classVar = 0;

    // Declaration and initialization of private static String classVar2
    private static String classVar2 = 'Hello';

    // Declaration and initialization of public Integer instanceVar
    public Integer instanceVar = 0;

    // Declaration and initialization of private String instanceVar2
    private String instanceVar2 = 'World';

    // Constructor
    public AccountDemo() {
        instanceVar = 10;
    }

    // Getter and Setter for instanceVar2
    public String getInstanceVar2() {
        return instanceVar2;
    }

    public void setInstanceVar2(String newValue) {
        if(newValue != null && newValue != ''){
            instanceVar2 = newValue;
        } else {
            instanceVar2 = 'World';
        }
    }

    // Method that uses a SOQL Query to fetch Account records
    public List<Account> getAccounts() {
        List<Account> accountList = [SELECT Id, Name, Type FROM Account LIMIT 10];
        return accountList;
    }

    // For loop to access each Account record returned by getAccounts()
    public void displayAccountInfo() {
        List<Account> accountList = getAccounts();
        for (Account acc : accountList) {
            System.debug('Account Name: ' + acc.Name);
            if(acc.Type == 'Prospect'){
                System.debug('Account Type: Potential ' + acc.Type);
            } else {
                System.debug('Account Type: ' + acc.Type);
            }
        }
    }

    // Local Variable and For Loop
    public void displayNumbers() {
        // Declaration and initialization of local variable localVar
        Integer localVar = 5;
        if(localVar > 0){
            for (Integer i = 0; i < localVar; i++) {
                System.debug('Value of i: ' + i);
            }
        } else {
            System.debug('The local variable value is not greater than zero');
        }
    }
}