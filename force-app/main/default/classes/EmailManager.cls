public class EmailManager {

    
    public static void sendMail(String address, String subject, String body)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> addressList = new LIST<String>();
        addressList.add(address);
        mail.setToAddresses(addressList);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail} );
    }
}