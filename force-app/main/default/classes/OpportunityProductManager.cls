public with sharing class OpportunityProductManager {   
    
    public static OpportunityLineItem  createOpportunityProduct(Product2 product, Integer quantity, String opportunityId, Decimal discount){

        OpportunityLineItem  item;
        if(discount == 0){
                item = new OpportunityLineItem (
                Product2Id = product.Id,
                Quantity = quantity,
                OpportunityId = opportunityId,
                UnitPrice = product.Price__c
                            );
        }else{
                item = new OpportunityLineItem (
                Product2Id = product.Id,
                Quantity = quantity,
                OpportunityId = opportunityId,
                Discount = discount,
                UnitPrice = product.Price__c
            );
        }
        return item;
    }
    public static void OrderProducts(List<Product2> products, String opportunityName, String lastName,String firstName, String email, String phone){
        
        Lead lead = [SELECT Name,Email,Phone FROM Lead WHERE Email =: email AND Phone =: phone LIMIT 1];
        Contact contact = [SELECT Name,Email,Phone FROM Contact WHERE Email =: email AND Phone =: phone LIMIT 1];
        List<OpportunityLineItem> items = new List<OpportunityLineItem>();
        Opportunity opportunity;
        Map<Product2,Integer> orderedProducts = new Map<Product2,Integer>();

        if(contact != null){
            opportunity = OpportunityManager.createOpportunity(opportunityName, contact);
        }else if(lead != null){
            opportunity = OpportunityManager.createOpportunity(opportunityName, lead);
        }else{
            opportunity = OpportunityManager.createOpportunity(opportunityName,FirstName,LastName,email,phone);
        }
        insert opportunity;
        
        for (Product2 prod : products) {    
            if(orderedProducts.containsKey(prod)){
                orderedProducts.put(prod, orderedProducts.get(prod) + 1);
            }else{
                orderedProducts.put(prod,1);
            }
        }
        for (Product2 key : orderedProducts.keySet()) {
            items.add(createOpportunityProduct(key,orderedProducts.get(key),opportunity.Id,0));
        }
        insert items;

    }
}
