public with sharing class OutletController {
    
    @AuraEnabled
    public static Map<String,String> getDeliveryTypesValues(){
        Map<String,String> deliveryTypesValues = new Map<String,String>();
        Schema.DescribeFieldResult fieldResult = Opportunity.DeliveryType__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry f : ple)
        {
            deliveryTypesValues.put(f.label, f.value);
        }       
        return deliveryTypesValues;
    }
    @AuraEnabled
    public static Map<String,String> getDeliveryPoints(){
        Map<String,String> maps = new Map<String,String>();
        List<Outlet__c> outlets = OutletManager.getAllOutlets();
        for(Outlet__c outlet : outlets){
            String str = outlet.Name + ',' + outlet.Street__c + ',' + outlet.City__c;
            System.debug(str);
            maps.put(str, outlet.Id);
        }
        return maps;
    }

}
