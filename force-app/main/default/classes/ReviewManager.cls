public class ReviewManager {
    
    @AuraEnabled
    public static void createReview(String email,String reviwerName, String subject, String body, Decimal rate, String productId, Datetime creationTime){
        
        if(productId == null || productId == ''){
            return;
        }
        ProductReview__c review = new ProductReview__c(
            ReviewerEmail__c = email,
            ReviewerName__c = reviwerName,
            ReviewSubject__c = subject,
            ReviewBody__c = body,
            ProductRate__c = rate,
            ProductId__c = productId,
            CreationDateTime__c = creationTime
        );
        insert review;

        Product2 product = [SELECT Id,Rate__c FROM Product2 WHERE Id =: productId LIMIT 1];
        
        product.Rate__c = countProductRate(productId, rate);
        update product;
    }
    private static Decimal countProductRate(String productId, Decimal rate){

        List<ProductReview__c> allProductReviews = [SELECT ProductRate__c FROM ProductReview__c WHERE ProductId__c =: productId];
        Decimal ratesSum = 0;


        for (ProductReview__c productReview : allProductReviews) {   
            ratesSum += productReview.ProductRate__c;
        }
        return countRate(ratesSum, allProductReviews.size());

    }
    public static Decimal countRate(Decimal sum, Integer numberOfReview){
        return sum / numberOfReview;
    }
}
