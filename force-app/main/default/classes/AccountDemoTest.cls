@isTest
public class AccountDemoTest {

    // Test case for the constructor
    @isTest
    static void testConstructor() {
        // Create an instance of the AccountDemo class
        AccountDemo demo = new AccountDemo();
        // Ensure that the instance variable instanceVar is set to 10 by the constructor
        System.assertEquals(10, demo.instanceVar);
    }

    // Test case for the getter and setter
    @isTest
    static void testGetterSetter() {
        // Create an instance of the AccountDemo class
        AccountDemo demo = new AccountDemo();
        // Set the value of instanceVar2 using the setter method
        demo.setInstanceVar2('New Value');
        // Ensure that the value of instanceVar2 is set correctly using the getter method
        System.assertEquals('New Value', demo.getInstanceVar2());
        demo.setInstanceVar2('');
        // Ensure that the value of instanceVar2 is set correctly using the getter method
        System.assertEquals('World', demo.getInstanceVar2());
    }

    // Test case for the getAccounts method
    @isTest
    static void testGetAccounts() {
        // Create a list of 10 Account records with different names and the same type
        List<Account> accountList = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            Account acc = new Account(Name='Test Account ' + i, Type='Prospect');
            accountList.add(acc);
        }
        // Insert the list of Account records into the database
        insert accountList;

        // Create an instance of the AccountDemo class
        AccountDemo demo = new AccountDemo();
        // Call the getAccounts method to fetch a list of Account records
        List<Account> accounts = demo.getAccounts();
        // Ensure that the size of the returned list is 10
        System.assertEquals(10, accounts.size());
        // Loop through the returned list and ensure that each record has the correct name and type
        for (Integer i = 0; i < accounts.size(); i++) {
            System.assertEquals('Test Account ' + i, accounts[i].Name);
            System.assertEquals('Prospect', accounts[i].Type);
        }
    }

    // Test case for the displayAccountInfo method
    @isTest
    static void testDisplayAccountInfo() {
        // Create a list of 10 Account records with different names and the same type
        List<Account> accountList = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            Account acc = new Account(Name='Test Account ' + i, Type='Prospect');
            accountList.add(acc);
        }
        // Insert the list of Account records into the database
        insert accountList;

        // Create an instance of the AccountDemo class
        AccountDemo demo = new AccountDemo();
        // Start a test transaction
        Test.startTest();
        // Call the displayAccountInfo method, which should display information about the 10 Account records
        demo.displayAccountInfo();
        // Stop the test transaction
        Test.stopTest();
    }

    // Test case for the displayNumbers method
    @isTest
    static void testDisplayNumbers() {
        // Create an instance of the AccountDemo class
        AccountDemo demo = new AccountDemo();
        // Start a test transaction
        Test.startTest();
        // Call the displayNumbers method, which should display numbers from 1 to 5
        demo.displayNumbers();
        // Stop the test transaction
        Test.stopTest();
    }

	// Test case for the class variables
    @isTest
    static void testClassVariables() {
        // Create an instance of the AccountDemo class
        AccountDemo demo1 = new AccountDemo();
        // Increment the value of classVar using the instance of the class
        AccountDemo.classVar++;
        // Ensure that the value of classVar is incremented
        System.assertEquals(1, AccountDemo.classVar);

        // Create a second instance of the AccountDemo class
        AccountDemo demo2 = new AccountDemo();
        // Ensure that the value of classVar is still 0 for the new instance
        System.assertEquals(1, AccountDemo.classVar);

        // Increment the value of classVar using the class name
        AccountDemo.classVar++;
        // Ensure that the value of classVar is incremented
        System.assertEquals(2, AccountDemo.classVar);

        // Ensure that the value of classVar2 is correct
        // Variable is not visible: AccountDemo.classVar2
        //System.assertEquals('Hello', AccountDemo.classVar2);
    }
}