//update field

trigger BookDiscountTrigger on Book__c (before insert,
        before update,
        before delete,
        after insert) {
        
        //write code
        //insert book
        if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
            Book__C[] books = Trigger.new;
            system.debug('Calling APTS_BJ_MyHelloWorld.applyDiscount() method from BookDiscountTrigger for books: ' + books);
            if(books.size() > 0) {
	            APTS_BJ_MyHelloWorld.applyDiscount(books);
            } else {
                //book__c book = new Book__c(Name='Salesforce Learning', Price__c=100);
                //insert book;
            }
        } else if(Trigger.isBefore && Trigger.isDelete) {
            // Code
            Book__C[] books = Trigger.new;
            //system.debug('Calling APTS_BJ_MyHelloWorld.applyDiscount() method from BookDiscountTrigger for books: ' + books);
            //APTS_BJ_MyHelloWorld.applyDiscount(books);
        } else if(Trigger.isAfter && Trigger.isInsert) {
            // Code
            Book__C[] books = Trigger.new;
            //system.debug('Calling APTS_BJ_MyHelloWorld.applyDiscount() method from BookDiscountTrigger for books: ' + books);
            //APTS_BJ_MyHelloWorld.applyDiscount(books);
        }
}