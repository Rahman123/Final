public class TestLightningController {
	
    @AuraEnabled
    public static  Account getAccount(Id accountId){
    	return [
            SELECT Name 
            FROM Account
            WHERE id = :accountId
        ];    
    }
    
}