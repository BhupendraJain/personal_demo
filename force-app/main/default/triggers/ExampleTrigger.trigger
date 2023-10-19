trigger ExampleTrigger on Contact (before insert, after insert, after delete) {
    
    if (Trigger.before && Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        // Call a utility method from another class
        EmailManager.sendMail('bhupendra.jain@globant.com', 'Trailhead Trigger Tutorial', 
                    recordCount + ' contact(s) were inserted.');
    }
    else if (Trigger.after && Trigger.isInsert) {

    }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}