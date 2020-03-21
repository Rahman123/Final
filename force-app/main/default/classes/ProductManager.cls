public class ProductManager {
	@AuraEnabled
    public static List<Product2> getAllProducts (){
        List<Product2> products = [SELECT Name,(SELECT UnitPrice FROM PricebookEntries) From Product2];
        return products;
    }
    @AuraEnabled
    public static Integer countProducts(){
        return [SELECT COUNT() FROM Product2];
    }
    public static String createSOQLQueryString(List<String> fieldNames, String sojbectName,Map<String,String> filters, Map<String,String> operators){
        
        String query = 'SELECT ';
        // form fileds that we want to get
        for (Integer i = 0; i < fieldNames.size(); i++) {
            // last field should not have comma after
            if(i == fieldNames.size() - 1){
                query += fieldNames[i];
                break;
            }
            query += fieldNames[i] + ',';
        }
        // Add FROM block
        query += ' FROM ' + sojbectName + ' ';
        // check for filters if exist => continue
        if(filters != null  && operators != null){
        //flag on first filter
        Boolean firstRequest = true;
        for (String key : filters.keySet()) {
             String value = filters.get(key);
             System.debug(value);
             if(firstRequest && value != null && value != ''){
                 query += 'WHERE ' + key + ' ' + getRequestString(value, operators.get(key));
                 firstRequest = false;
             }else if(value != null && value != ''){
                 query += ' AND ' + key + ' ' + getRequestString(value, operators.get(key));
             }
         }
        }
        return query;
    }
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
        String query = createSOQLQueryString(Constants.ALL_PRODUCT2_FIELDS_CONST, 'Product2', filters, operators);
        if(maxPrice != ''){
            Map<String,String> subQueryFilters = new Map<String,String>();
            subQueryFilters.put('UnitPrice', maxPrice);
            Map<String,String> subQueryOperators = new Map<String,String>();
            subQueryOperators.put('UnitPrice', '<=');
            List<String> fileds = new List<String>();
            fileds.add('Product2Id');
            query  = addSubQueryFilter(query, 'Id', 'IN', createSOQLQueryString(fileds, 'PricebookEntry', subQueryFilters, subQueryOperators));
        }
        query = addOrderBySectionToQuery(query, 'Name');
        query = addLimitSectionToQuery(query, limits);
        query = addOffsetSectionToQuery(query, offset);
        
        System.debug(query);
        return Database.query(query);
    }
    private static String getRequestString(String value, String operator){

        if(operator.containsIgnoreCase('like')){
            return 'LIKE \'%' + value + '%\'';
        }else if(Constants.ARIFMETIC_OPERATORS_CONST.contains(operator)){
            return operator + value;
        }
        return '';

    }
    public static String addSubQueryFilter(String query, String fieldName,String operator, String subQuery){
        if(query.contains('WHERE')){            
            return query += 'AND'+' ' + fieldName + ' ' + operator + ' ' + '(' + subQuery + ')';
        }
        return query += 'WHERE' + ' ' + fieldName + ' ' + operator + ' ' + '(' + subQuery + ')';
    }
    public static String addLimitSectionToQuery(String query,Integer numberOfElements){
        return query += ' ' + 'LIMIT' + ' ' + String.valueOf(numberOfElements);
    }
    public static String addOffsetSectionToQuery(String query, Integer shift){
        return query += ' ' + 'OFFSET' + ' ' + String.valueOf(shift);
    }
    public static String addOrderBySectionToQuery(String query, String fileToOrderBy){
        return query += ' ' + 'ORDER BY' + ' ' + fileToOrderBy;
    }
    /*
    @AuraEnabled
    public static List<Product2> sortProducts (String productName,Integer productMinPrice, Integer productMaxPrice, String productCatigory, Integer productTravelDistance){
            List<Product2> products = [SELECT Name,Price__c,Catigory__c,TravelDistance__c From Product2];
            products = sortProductsByName(productName,products);
            products = sortProductsByPrice(productMinPrice,productMaxPrice,products);
            products = sortProductsByCatigory(productCatigory,products);
            products = sortProductsByTravelDistance(productTravelDistance,products);
            return products;
    }
    public static List<Product2> sortProductsByName(String productName, List<Product2> products){
        if(productName != null || productName != ''){
            List<Product2> sortedProducts = new List<Product2>();
            for (Product2 prod : products) {
                if(prod.Name.contains(productName)){
                    sortedProducts.add(prod);
                }
            } 
            return sortedProducts;
        }
        return products;
    }
    public static List<Product2> sortProductsByPrice(Integer productMinPrice, Integer productMaxPrice, List<Product2> products){
        if(productMinPrice != null && productMaxPrice != null){
            List<Product2> sortedProducts = new List<Product2>();
            for (Product2 prod : products) {
                if(prod.Price__c >= productMinPrice && prod.Price__c <= productMaxPrice){
                    sortedProducts.add(prod);
                }
            } 
            if(sortedProducts.size() > 0){
                return sortedProducts;
            }else{
                return products;
            }
        }else if(productMinPrice != null){
            List<Product2> sortedProducts = new List<Product2>();
            for (Product2 prod : products) {
                if(prod.Price__c >= productMinPrice){
                    sortedProducts.add(prod);
                }
            } 
            if(sortedProducts.size() > 0){
                return sortedProducts;
            }else{
                return products;
            }
        }else if(productMaxPrice != null){
            List<Product2> sortedProducts = new List<Product2>();
            for (Product2 prod : products) {
                if(prod.Price__c <= productMaxPrice){
                    sortedProducts.add(prod);
                }
            } if(sortedProducts.size() > 0){
                return sortedProducts;
            }else{
                return products;
            }
        }
            return products;
    }
    public static List<Product2> sortProductsByCatigory(String productCatigory, List<Product2> products){
        if(productCatigory != null || productCatigory != ''){
            List<Product2> sortedProducts = new List<Product2>();
            for (Product2 prod : products) {
                if(prod.Catigory__c.contains(productCatigory)){
                    sortedProducts.add(prod);
                }
            } 
            return sortedProducts;
        }
        return products;
    }
    public static List<Product2> sortProductsByTravelDistance(Integer productTravelDistnace, List<Product2> products){
        if(productTravelDistnace != null){
            List<Product2> sortedProducts = new List<Product2>();
            for (Product2 prod : products) {
                if(prod.TravelDistance__c >= productTravelDistnace){
                    sortedProducts.add(prod);
                }
            } 
            return sortedProducts;
        }
        return products;
    }*/
}