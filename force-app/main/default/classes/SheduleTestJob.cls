global class SheduleTestJob implements Schedulable {
	
    global void execute (SchedulableContext sc){
        
        List<Account> accounts = [SELECT Id,Name FROM Account];
        
        for(Integer i = 0; i < accounts.size(); i++){
          	accounts[i].Name = 'SheduleTestJob' + i; 
        }
        update accounts;
    }
    
}