global class NbRBService {
    public static void getRateByCodeAndDate(String code, Date rateDate){
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('http://www.nbrb.by/API/ExRates/Rates/'+code +'?ParamMode=2&onDate='+rateDate);
        request.setMethod('GET');
        request.setTimeout(60000);
        
        HttpResponse response = new Http().send(request);
        Rate rate = (Rate)JSON.deserialize(response.getBody(), Rate.class);
        
        System.debug(rate.CUR_ID);
    }
    private class Rate{
        public String CUR_ID;
        public String Cur_Abbriviation;
        public String Cur_scale;
        public String Cur_Name;
        public String Cur_OfficialRate;
    }    
}