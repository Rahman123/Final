public  class AutoConvertLeads {
   
    @InvocableMethod
    public static void ConvertToContact(List<Id> leadIds){
        List<Contact> newContacts = new List<Contact>();
        
        List<Lead> leadsToConvert = [SELECT FirstName,LastName, Email,Phone FROM Lead WHERE Id IN: leadIds];
        
        for (Lead lead : leadsToConvert) {
            //fullfill Contact info
            Contact contact = new Contact();
            contact.FirstName = lead.FirstName;
            contact.LastName = lead.LastName;
            contact.Phone = lead.Phone;
            contact.Email = lead.Email;
            newContacts.add(contact);
        }
        if(leadsToConvert.size() > 0)
            delete leadsToConvert;
        if(newContacts.size() > 0)
            insert newContacts;
    }
}
