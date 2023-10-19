trigger APTS_BJ_HelloWorldTrigger on Account (before insert) {
    System.debug('Hello World!');
    for(Account a : trigger.New) {
        a.description = 'New Trigger Description';
    }
}