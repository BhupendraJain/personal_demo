@isTest
public class APTS_BJ_MYHelloWorldTest1 {

    static testMethod void validateHelloWorld()
    {
        Book__c[] books = [select id, Price__c from Book__c limit 5];
        APTS_BJ_MyHelloWorld.applyDiscount(books);
    }
    
}