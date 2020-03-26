global class GetCurrencyRatesSheduleJob  implements Schedulable{
    
    global static void execute(SchedulableContext sc){
        NbRBService.getRateByCodeAndDate('USD', Date.today());
    }
}
