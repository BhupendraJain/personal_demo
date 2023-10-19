public class APTS_BJ_BookPrice {

public Integer i = 0;
public String str;
public List<String> strList;
final public Set<String> s;
public Map<ID, String> m;


    public APTS_BJ_BookPrice() {
        //String str = null;
        //Boolean b = str.contains('xyz');
        this('ABC');
    }
    
    public APTS_BJ_BookPrice(String s) {
    
    }

    // Call this method
    public void applydiscount(Book__c book) {
    
        Integer int1;
        
        System.dEBug('befor: ' + book.Price__c);
        book.Price__c = book.Price__c * .9;
        System.debug('after: ' + book.Price__c);
        
        System.debug(INt1);
    // Save the Book object
    // DML
    // SOQL
    update book;
    }

}