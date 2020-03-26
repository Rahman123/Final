public with sharing class OpportunityController {
    @AuraEnabled
    public static void orderProductsPickup(Product2 product,Decimal price, String lastName,String firstName, String email, String phone,String outletId, String deliveryType){

        Opportunity opportunity = OpportunityManager.createOpportunity(firstName, lastName, email, phone);
        opportunity.OutletId__c = outletId;
        opportunity.DeliveryType__c = deliveryType;
      //  opportunity.DeliveryAddress__c = [SELECT Street__c,City__c FROM Outlet__c WHERE Id =: outletId];
        insert opportunity;
        OpportunityLineItem opportunityLineItem = OpportunityProductManager.createOpportunityProduct(product,price,1,opportunity.Id,0);
        // check if list of products has duplicates: add one insert and add 1 to quantity
        insert opportunityLineItem;
    }
    @AuraEnabled
    public static void orderProductsCourier(Product2 product,Decimal price, String lastName,String firstName, String email, String phone,String street,String city,String country, String deliveryType){

        Opportunity opportunity = OpportunityManager.createOpportunity(firstName, lastName, email, phone);
        opportunity.DeliveryAddress__c = country + ',' + city + ',' + street;
        opportunity.DeliveryType__c = deliveryType;
        opportunity.OutletId__c = Constants.MAIN_WAREHOUSE_ID_CONST;
        System.debug(opportunity);
        insert opportunity;
        OpportunityLineItem opportunityLineItem = OpportunityProductManager.createOpportunityProduct(product,price,1,opportunity.Id,0);
        insert opportunityLineItem;
    }
    @AuraEnabled
    public static void orderProductsPost(Product2 product,Decimal price, String lastName,String firstName, String email, String phone,String postCode, String deliveryType){
        Opportunity opportunity = OpportunityManager.createOpportunity(firstName, lastName, email, phone);
        opportunity.OutletId__c = Constants.MAIN_WAREHOUSE_ID_CONST;
        opportunity.DeliveryAddress__c = 'PostCode: ' + postCode;
        insert opportunity;
        OpportunityLineItem opportunityLineItem = OpportunityProductManager.createOpportunityProduct(product,price,1,opportunity.Id,0);
        // check if list of products has duplicates: add one insert and add 1 to quantity
        insert opportunityLineItem;
    }
    @AuraEnabled
    public static Map<String,String> getDeliveryTypesValues(){
        return OpportunityManager.getDeliveryTypesValues();
    }    
    @AuraEnabled
    public static Map<String,String> getRelatedOutlets(){
        return OutletController.getDeliveryPoints();
    }
}
