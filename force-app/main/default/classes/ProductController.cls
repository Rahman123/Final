public with sharing class ProductController {
    @AuraEnabled(cacheable=true)
    public static List<Product2> getSortedProducts(Map<String,String> filters, Map<String,String> operators, Integer offset, Integer limits){
        String maxPrice;
        if(filters.containsKey('maxPrice')){
            if(filters.get('maxPrice') != '' && filters.get('maxPrice') != null){
                maxPrice =filters.get('maxPrice');
                filters.remove('maxPrice');
            }
        }else{
            maxPrice = '';
        }
        String query = SOQLQueryCreator.createSOQLQueryString(Constants.ALL_PRODUCT2_FIELDS_CONST, 'Product2', filters, operators);
        if(maxPrice != ''){
            Map<String,String> subQueryFilters = new Map<String,String>();
            subQueryFilters.put('UnitPrice', maxPrice);
            Map<String,String> subQueryOperators = new Map<String,String>();
            subQueryOperators.put('UnitPrice', '<=');
            List<String> fileds = new List<String>();
            fileds.add('Product2Id');
            query  = SOQLQueryCreator.addSubQueryFilter(query, 'Id', 'IN', SOQLQueryCreator.createSOQLQueryString(fileds, 'PricebookEntry', subQueryFilters, subQueryOperators));
        }
        query = SOQLQueryCreator.addOrderBySectionToQuery(query, 'Name');
        query = SOQLQueryCreator.addLimitSectionToQuery(query, limits);
        query = SOQLQueryCreator.addOffsetSectionToQuery(query, offset);
        
        System.debug(query);
        return ProductManager.getProductsByQueryString(query);
    }
    @AuraEnabled
    public static String getAttachedImage(String parentId){
        List<Attachment> att = [SELECT Id FROM Attachment Where ParentId =: parentId LIMIT 1];
        return att[0].Id;
    }
    @AuraEnabled
    public static Decimal getCurrencyRate(String currencyName){
        return Currency__c.getValues(currencyName).USD_rate__c;
    }
}
