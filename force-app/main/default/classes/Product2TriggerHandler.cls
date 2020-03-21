public  class Product2TriggerHandler extends TriggerHandler{
    public override void afterDelete(){

        // List<Product2> oldProducts = trigger.Old;
        // List<SObject> objectsToDelete = new List<SObject>();
        // List<Id> infoIds = new List<Id>();

        // List<PricebookEntry> pricebookEntries = [SELECT Id FROM PricebookEntry WHERE Product2Id IN: trigger.OldMap.keySet()];
        // List<ProductReview__c> reviews = [SELECT Id FROM ProductReview__c WHERE ProductId__c IN: trigger.OldMap.keySet()];
        
        // // for (Product2 prod : oldProducts) {
        // //     infoIds.add(prod.ScooterInfoId__c);
        // // }
        
        // // List<ScooterInfo__c> info = [SELECT Id FROM ScooterInfo__c WHERE Id IN: infoIds];
        // //     // select details by ids
            
        // //     // deleting details by ids
        // //     if(info.size() > 0){
        // //         objectsToDelete.addAll(info);
        // //     }
        //     if(pricebookEntries.size() > 0){
        //         objectsToDelete.addAll(pricebookEntries);
        //     }
        //     if(reviews.size() > 0){
        //         objectsToDelete.addAll(reviews);
        //     }
        
        // if(objectsToDelete.size() > 0){
        //     delete objectsToDelete;
        // }
    }
    public override void afterInsert(){

        list<product2> newproducts = trigger.new;

        list<PricebookEntry> newPricebookEntries = new list<PricebookEntry>();

        for (Product2 prod : newproducts) {      

            PricebookEntry standartPricebookEntry = new PricebookEntry(
                Pricebook2Id = CONST_Pricebooks.STANDART_PRICEBOOK_ID_CONST,
                Product2Id = prod.Id,
                UnitPrice = prod.Price__c,
                IsActive = true
            ); 
             PricebookEntry pricebookEntry = new PricebookEntry(
                 Product2id = prod.Id,
                 Pricebook2id = CONST_Pricebooks.SCOOTERS_PRICEBOOK_ID_CONST,
                 Unitprice = prod.Price__c,
                 IsActive = true
             );

             newPricebookEntries.add(standartPricebookEntry);
             newPricebookEntries.add(pricebookEntry);
         }
         insert newPricebookEntries;
     }
}
