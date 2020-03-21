public class AccountTriggerHandler extends TriggerHandler{
    /*
    public override void afterInsert (){
        List<Contact> contacts = new List<Contact>();
        List<Account> accounts = (List<Account>)trigger.new;
        
        for(Account temp : accounts){
			Contact contact = new Contact(AccountId = temp.Id, FirstName = temp.Name, LastName = '');
			contacts.Add(contact);
        }
        
        insert contacts;
        
    }*/
    
    public override void afterUpdate(){
        List<Account> newAccounts = (List<Account>)trigger.new;
        List<Account> accountsBeforeUpdate = (List<Account>)trigger.old;
        
        // contacts, linked to acc
        List<Contact> contacts = [SELECT FirstName,Id,AccountId FROM Contact WHERE AccountId IN :trigger.newMap.keySet()]; 
        
        List<Contact> contactsForUpdate = new List<Contact>();

        for(Integer i = 0;i < newAccounts.size(); i++){
            // if name was changed:
            if(accountsBeforeUpdate[i].Name != newAccounts[i].Name){
                
                for(Contact contact : contacts){
                    if(contact.AccountId == newAccounts[i].Id){
                        contact.FirstName = newAccounts[i].Name;
                        contactsForUpdate.add(contact);
                    }
                }

			}
        }
        
        update contactsForUpdate;
    }
    
}