public with sharing class CaseTriggerHandler extends TriggerHandler{
    
    public override void beforeInsert(){
        
        List<String> emails = new List<String>();
        List<Lead> newLeads = new List<Lead>();
        
        for(Case item : (List<Case>)Trigger.new) {
            if(item.SuppliedEmail != null){
                emails.add(item.SuppliedEmail);
            }
        }

        
        for (Lead item : [SELECT Id,Email FROM Lead WHERE Email IN :emails]){
            for (Case itemCase : (List<Case>)Trigger.new) {
                if(itemCase.SuppliedEmail == item.Email){
                    itemCase.Lead__c = item.Id;
                    break;
                }
            }
        }
        for (Contact item : [SELECT Id,Email FROM Contact WHERE Id IN :emails]){
            for (Case itemCase : (List<Case>)Trigger.new) {
                if(itemCase.SuppliedEmail == item.Email){
                    itemCase.ContactId = item.Id;
                    break;
                }else{
                    Lead lead = new Lead(
                    Email = item.SuppliedEmail,
                    LastName = 'question',
                    Company = 'asd'
                        );
                newLeads.add(lead);
                }
            }
        }
        insert newLeads;

         Integer i = 0;
         for (Case item : (List<Case>)Trigger.new) {
             if(item.ContactId == null && item.Lead__c == null){
                 item.Lead__c = newLeads[i].Id;
                 i++;
             }
         }
    }
}
