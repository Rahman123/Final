global class BatchTest implements Database.Batchable<sObject> {
	
    private String sql;
    
    global DataBase.QueryLocator start(Database.BatchableContext dbc){
        // responsible for selecting items
        return DataBase.getQueryLocator('select Name from Account');
    }
    global void execute (Database.BatchableContext BC, List<Account> scope){
		// logic
		
        for(Integer i = 0; i < scope.size(); i++){
          	scope[i].Name = 'SheduleTestJob' + i; 
        }
        update scope;
        
    }
    global void finish (Database.BatchableContext BC){
        // logic
    }
    
}