public with sharing class OutletManager {
    
    @AuraEnabled
    public static List<Outlet__c> getOutlets(){
        return [SELECT Id,Name,Location__Latitude__s, Location__Longitude__s FROM Outlet__c];
    }
    
}
