@isTest
private class APTS_BJ_MyHelloWorldTestClass {
    
    static testMethod void validateHelloWorld()
    {
        test.startTest();

        book__c book = new Book__c(Name='Salesforce Learning', Price__c=100);
        System.debug('Before entering book : '+ book.Name + ', Price is : ' + book.Price__c);
        
        insert book;
        
        System.debug('Book.Id : ' + book.Id);
        book = [SELECT Name, Price__c from Book__c where Id =: book.Id];
        
        test.stopTest();
        
        System.debug('After trigger fired, Price of book : '+ book.Name +', is : '+ book.Price__c);
        
        //System.assertEquals(90, book.Price__c);
        System.assert(book.Price__c == 90);
    }
    
}