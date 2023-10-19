trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Task> taskList = new List<Task>();
    
    // Add a task for each opportunity
    // Iterate over opportunities that are in this trigger.
    for (Opportunity a : [SELECT Id FROM Opportunity
                     WHERE Id IN :Trigger.New and stageName='Closed Won']) {
        // Add a default task for this opportunity
        taskList.add(new Task(whatId=a.Id, subject='Follow Up Test Task')); 
    }
    
    if (taskList.size() > 0) {
        insert taskList;
    }

}