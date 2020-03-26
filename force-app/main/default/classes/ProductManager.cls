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
    public static List<Product2> getProductsByQueryString(String query){
        return Database.query(query);
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