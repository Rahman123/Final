@RestResource(urlMapping='/FirstRestService/*')
global class FirstRestService  {
	
    @httpGet
    global static void get(){
        
        String leadId = RestContext.request.params.get('id');
        List<Lead> leads = [SELECT Name FROM Lead WHERE Id =: leadId];
        
        RestResponse res = RestContext.response;
        
        if(res == null){
            res = new RestResponse();
        	RestContext.response = res;
        }
        
        res.addHeader('Content-Type', 'application/json');
        // 200 - Ok, 400 - known erro, 500 - unnown error
        res.StatusCode = 200;
        //blob - binary format (bites)
        res.responseBody = Blob.valueOf(JSON.serialize(leads));
    }
    @httpPost
    global static void post(){
        
        //String body = RestContext.request.requestBody.toString();

        Info bodyInstance = (Info)JSON.deserialize(RestContext.request.requestBody.toString(),Info.class);	
        
        //List<Lead> leads = [SELECT Email,Id FROM Lead WHERE Email =: bodyInstance.email];
        
        List<Lead> leads = [SELECT Email,Id FROM Lead WHERE Email = :bodyInstance.email];
        Lead lead = new Lead();

        if(leads.isEmpty()){

            lead.Email = bodyInstance.email;
            lead.LastName = 'Name';
            lead.Company = 'Company';

            insert lead;
        }else{
            lead = leads[0];
        }
        /*
        if(leads.size() == 0){
            Lead lead = new Lead();
            leads.add(lead);
        }
        for (Lead temp : leads) {
            Case case = new Case(Subject = bodyInstance.question, OwnerId = temo.Id);
        }*/
        
        Case newCase = new Case(Subject = bodyInstance.question, Lead__c = lead.Id);
        insert newCase;

        RestResponse res = RestContext.response;
        
        if(res == null){
            res = new RestResponse();
        	RestContext.response = res;
        }
        
        res.addHeader('Content-Type', 'application/json');
        // 200 - Ok, 400 - expected error, 500 - unknown error
        res.StatusCode = 200;
        //blob - binary format (bites)
        res.responseBody = Blob.valueOf(JSON.serialize(newCase.Id));
       
    }
    private class Info{
        public String question;
        public String email;
    }
}