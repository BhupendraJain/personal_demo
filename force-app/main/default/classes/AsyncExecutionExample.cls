public class AsyncExecutionExample implements Queueable {

    public void execute(QueueableContext context) {
        Account a = new Account(Name='Acme Queueable 2',Phone='(415) 555-1213');
        insert a;
        system.debug('acc id: ' + a.id);
    }
}