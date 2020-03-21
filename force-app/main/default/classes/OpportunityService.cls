// @RestResource(urlMapping='/OpportunityManagment/*')
global class OpportunityService {
    
    @AuraEnabled
    global static void OrderRequest(List<Product2> products, String opportunityName, String lastName,String firstName, String email, String phone){

        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        Http http = new Http();
        CreateOpportunityRequestBody body = new CreateOpportunityRequestBody();

        body.products = products;
        body.opportunityName = opportunityName;
        body.lastName = lastName;
        body.firstName = firstName;
        body.email = email;
        body.phone = phone;

        
        request.setEndpoint('https://seminski-dev-ed.my.salesforce.com/services/apexrest/order');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer 00D2v000002J7pd!AQMAQPmKNC5hCUTrBJ7WpbwRmlHrx65fWgFRmxAUPAmU.MHVlhI2fr92ZCkExQ5JBTaaM_JTAWWZcNBysc8ozC0mBj_rvNds');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(JSON.serialize(body));
    //    request.setBody('products='+EncodingUtil.base64Encode(Blob.valueOf(body)));
        request.setTimeout(60000);

        try {
            response = http.send(request);
        } catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            System.debug(response.toString());
        }
    }
    public class CreateOpportunityRequestBody {
        public List<Product2> products;
        public String opportunityName;
        public String lastName;
        public String firstName;
        public String email;
        public String phone;
    }
    
    
}
