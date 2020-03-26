global class NbRBService {
    @future(callout=true)
    public static void getRateByCodeAndDate(String code, Date rateDate){
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('http://www.nbrb.by/API/ExRates/Rates/'+code +'?ParamMode=2&onDate='+rateDate);
        request.setMethod('GET');
        request.setTimeout(60000);
        
        HttpResponse response = new Http().send(request);
        Rate rate = (Rate)JSON.deserialize(response.getBody(), Rate.class);
        
        Currency__c c = Currency__c.getValues('USD');
        c.USD_rate__c = rate.Cur_OfficialRate;
        upsert c;

    }
    private class Rate{
        public String CUR_ID;
        public String Cur_Abbriviation;
        public String Cur_scale;
        public String Cur_Name;
        public Decimal Cur_OfficialRate;
    }    
}