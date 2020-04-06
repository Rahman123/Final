global class NbRBService {
    
    public static Map<String,Decimal> getRatesByCodeAndDate(Date rateDate){
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('http://www.nbrb.by/API/ExRates/Rates?Periodicity=0');
        request.setMethod('GET');
        request.setTimeout(60000);
        
        HttpResponse response = new Http().send(request);
        List<Rate> rates = (List<Rate>)JSON.deserialize(response.getBody(), List<Rate>.class);
        Map<String,Decimal> currencyMap = new Map<String,Decimal>();
        for(Integer i =0; i< rates.size();i++){
            currencyMap.put(rates[i].Cur_Abbreviation, rates[i].Cur_OfficialRate / rates[i].Cur_Scale);   
        }
        return currencyMap;
    }
    private class Rate{
        public String CUR_ID;
        public String Cur_Abbreviation ;
        public Decimal Cur_Scale;
        public String Cur_Name;
        public Decimal Cur_OfficialRate;
    }    
}