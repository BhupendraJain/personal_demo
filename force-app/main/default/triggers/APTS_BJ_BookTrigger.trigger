trigger APTS_BJ_BookTrigger on Book__c (before insert, before update, after insert, after update) {

    if((trigger.isInsert || trigger.isUpdate) && trigger.isBefore) {
        System.debug('in Trigger');
        Book__c[] books = Trigger.new;
        APTS_BJ_MyHelloWorld.applyDiscount(books);
    } else if(trigger.isInsert && trigger.isAfter) {
        // Some Code
    } else if(trigger.isUpdate && trigger.isAfter) {
        //Some other code
    }
    

}