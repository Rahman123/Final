@RestResource(urlMapping = '/order/*')
global class OpportunityRestService {
    
    @httpPost
    global static void createOpportunity(){

        RestRequest request = RestContext.request;

        CreateOpportunityRequestBody body = (CreateOpportunityRequestBody)JSON.deserialize(request.requestBody.toString(), CreateOpportunityRequestBody.class);
        System.debug(body);
        OpportunityManager.orderProducts(body.products, body.opportunityName, body.lastName, body.firstName, body.email, body.phone);

        RestResponse res = RestContext.response;
        
        if(res == null){
            res = new RestResponse();
        	RestContext.response = res;
        }
        
        res.addHeader('Content-Type', 'application/json');
        // 200 - Ok, 400 - expected error, 500 - unknown error
        res.StatusCode = 200;
        //blob - binary format (bites)
        res.responseBody = Blob.valueOf(JSON.serialize(body.firstName));

    }
}
