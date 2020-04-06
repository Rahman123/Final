@isTest
public with sharing class ProductController_Test {
    @isTest
    static void getProductsList(){
        List<Product2> prod = DataFactoryProduct.insertProducts(DataFactoryProduct.getNewProducts());
        Test.startTest();
            ProductPageWrapper returnedProducts = ProductController.getProductsList(null,null,1,4);
        Test.stopTest();
        System.debug(returnedProducts);
        System.debug(returnedProducts.products);
        System.assertEquals(prod.size(), returnedProducts.products.size());
    }
    @isTest
    static void test_getAttachedImage(){
        Product2 prod = DataFactoryProduct.insertProducts(DataFactoryProduct.getProduct());
        Blob attachmentBody = EncodingUtil.base64Decode('AA==');
        Attachment attachment = new Attachment();
            attachment.Body = attachmentBody;
            attachment.Name = 'Test';
            attachment.ParentId = prod.Id; 
            insert attachment;
        Test.startTest();
            String attachId = ProductController.getAttachedImage(prod.Id);
        Test.stopTest();
        System.assertEquals(attachment.Id, attachId);
    }
    @isTest(SeeAllData = true)
    static void test_getCurrencyRate(){
        String currencyName = 'BYN';
        Decimal settingValue = Currency__c.getValues(currencyName).Rate__c;
        Test.startTest();
            Decimal testValue = ProductController.getCurrencyRate(currencyName);
        Test.stopTest();
        System.assertEquals(settingValue, testValue);
    }
}
