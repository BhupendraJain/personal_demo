trigger AccountDeletion on Account (before delete) {
    
     for(Account a : [SELECT id,name from Account WHERE id IN (Select Accountid from Opportunity) AND id IN :Trigger.old]){
        
        trigger.oldmap.get(a.id).addError('Cannot delete acc with related opps');
        
        
    }
    
    for(Account a : [SELECT id,name from Account WHERE id IN (Select Accountid from Contact) AND id IN :Trigger.old]){
        
        trigger.oldmap.get(a.id).addError('Cannot delete acc with related Contact');
        
        
    }
    
}