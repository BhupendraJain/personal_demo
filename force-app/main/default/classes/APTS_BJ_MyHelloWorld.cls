public class APTS_BJ_MyHelloWorld {

    public static void applyDiscount(Book__c[] books)
    {
        for(Book__c b:books)
        {
            b.Price__c *= 0.9;
            system.debug('In applyDiscount() Method for book ' + b.id + ', Price is: ' + b.price__c);
        }
    }
    
}