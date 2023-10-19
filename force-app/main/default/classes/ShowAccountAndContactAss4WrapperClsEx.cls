public class ShowAccountAndContactAss4WrapperClsEx {

public List<Contact> contactsList {get; set;}
public Map<String, List<Contact>> contactsMap {get; set;}

public ShowAccountAndContactAss4WrapperClsEx()
{

ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'This page was created using ONLY one query...'));

String query = 'SELECT Id, FirstName, LastName, Phone, Email, Account.Name FROM Contact order by Account.Name';
contactsList = Database.query(query);
contactsMap = new Map<String, List<Contact>>();

List<Contact> cList = new  List<Contact>();
for(Contact contacts : contactsList)
{
    String accName = contacts.Account.Name;
    if(contactsMap.containsKey(accName))
    {
         cList.add(contacts);
         contactsMap.put(accName, cList);
    }
    else
    {
         cList = new  List<Contact>();
         cList.add(contacts);
         contactsMap.put(accName, cList);
    }
}

System.debug('map is: ' + contactsMap);

}

}