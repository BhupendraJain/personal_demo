trigger AccountInsertionTrigger on Account (before insert, after insert) {

    // new = inserted or updated records
    // old = records before updated or deleted
    
        system.debug('HelloWorld');
        for(Account a : Trigger.new) {
           //a.description = 'Trigger Applied while creation of this Account';
        }
         for(id a : Trigger.newMap.keySet()) {
           system.debug('keys: ' + a);
        }

}