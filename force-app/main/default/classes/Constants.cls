public class Constants {
    
    public static final Set<String> ARIFMETIC_OPERATORS_CONST = new Set<String>{'<','>','<=','>=','='};
    public static final List<String> ALL_PRODUCT2_FIELDS_CONST = new List<String>{'Id','Name','BataryCapacity__c','Catigory__c','ChargingTime__c','Color__c','MaxSpeed__c','MaxWeight__c','TravelDistance__c','(SELECT UnitPrice FROM PricebookEntries)','(SELECT Id FROM Attachments limit 1)'   };
    public static final List<String> ALL_OUTLET_FIELDS_CONST = new List<String>{'Id','Name','Location__Latitude__s', 'Location__Longitude__s','OpenTime__c,PhoneNumber__c','CloseTime__c,Email__c,City__c','Street__c'};
    public static final String CURRENT_PRICEBOOK_ID_CONST = '01s2v00000NO9hKAAT';
    public static final String MAIN_WAREHOUSE_ID_CONST = 'a0F2v00001U8CA1EAN';
}
