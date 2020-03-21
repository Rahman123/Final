public class OpportunityManager {
    
    public static Opportunity createOpportunity(String opportunityName, Lead lead){
        Opportunity opportunity = new Opportunity(
            Name = opportunityName,
            Pricebook2Id = CONST_Pricebooks.SCOOTERS_PRICEBOOK_ID_CONST,
            StageName = 'Ordered',
            Probability = 100,
            CloseDate = Date.today().addDays(10),
            Lead__c = lead.Id,
            DeliveryType__c = 'Pickup',
            DeliveryAddress__c = 'here'
        );
        return opportunity;
    }
    public static Opportunity createOpportunity(String opportunityName,Contact contact){
        Opportunity opportunity = new Opportunity(
            Name = opportunityName,
            Pricebook2Id = CONST_Pricebooks.SCOOTERS_PRICEBOOK_ID_CONST,
            StageName = 'Ordered',
            Probability = 100,
            CloseDate = Date.today().addDays(10),
            Contact__c = contact.Id,
            DeliveryType__c = 'Pickup',
            DeliveryAddress__c = 'here'
        );
        return opportunity;
    }
    public static Opportunity createOpportunity(String opportunityName, String buyerFirstName, String BuyerLastName,String buyerEmail,String buyerPhone){
        Lead lead = new Lead(
            LastName = BuyerLastName,
            FirstName = buyerFirstName,
            Company = 'test',
            Email = buyerEmail,
            Phone = buyerPhone
        );
        insert lead;
        return createOpportunity(opportunityName, lead);
    }
    @AuraEnabled
    public static void orderProducts(List<Product2> products, String opportunityName, String lastName,String firstName, String email, String phone){

        List<Lead> leads = [SELECT Name,Email,Phone FROM Lead WHERE Email =: email AND Phone =: phone LIMIT 1];
        List<Contact> contacts = [SELECT Name,Email,Phone FROM Contact WHERE Email =: email AND Phone =: phone LIMIT 1];
        List<OpportunityLineItem> items = new List<OpportunityLineItem>();
        Opportunity opportunity;
        Map<Product2,Integer> orderedProducts = new Map<Product2,Integer>();

        if(contacts != null && contacts.size() > 0){
            opportunity = OpportunityManager.createOpportunity(opportunityName, contacts[0]);
        }else if(leads != null && leads.size() > 0){
            opportunity = OpportunityManager.createOpportunity(opportunityName, leads[0]);
        }else{
            opportunity = OpportunityManager.createOpportunity(opportunityName,FirstName,LastName,email,phone);
        }
        insert opportunity;
        // check if list of products has duplicates: add one insert and add 1 to quantity
        if(products != null){
        for (Product2 prod : products) {    
            if(orderedProducts.containsKey(prod)){
                orderedProducts.put(prod, orderedProducts.get(prod) + 1);
            }else{
                orderedProducts.put(prod,1);    
            }
        }
        for (Product2 key : orderedProducts.keySet()) {
            items.add(OpportunityProductManager.createOpportunityProduct(key,orderedProducts.get(key),opportunity.Id,0));
        }
        insert items;
    }

    }
}
