global with sharing class CurrenciesManager {
    @future(callout = true)
    public static void setCurrencyRates(Date rateDate){
        List<Currency__c> allCurrencies = Currency__c.getAll().values(); 
        Map<String,Decimal> returnedCurrencies = NbRBService.getRatesByCodeAndDate(rateDate);
        for (Currency__c curr : allCurrencies) {
            Decimal value = returnedCurrencies.get(curr.Name);
            if(value != null){
                curr.Rate__c = value;
            }
        }
        update allCurrencies;
    }
    public static Map<String,Decimal> getAllCurrencies(){
        Map<String,Decimal> currencyMap = new Map<String,Decimal>();
        for (Currency__c curr : Currency__c.getAll().values()) {
            currencyMap.put(curr.Name, curr.Rate__c);
        }
        return currencyMap;
    } 
}
    