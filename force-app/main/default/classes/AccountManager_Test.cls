@isTest
public class AccountManager_Test {
	/*
	@isTest
    public static void testGetAccountById_1(){
        
        Account account = new Account(
            Name = 'Test'
                );
    	
        insert account;
        //start/stop drops limits, waits for response
        Test.startTest();
        	Account result = AccountManager.GetAccountById(account.id);
        Test.stopTest();
        
        System.assertEquals('Test', result.Name);
            
    }   
    @isTest
    public static void testDeleteAccountById_1(){

        Account a = new Account(Name = 'test');
        insert a;

        Test.startTest();
        	AccountManager.DeleteAccountById(a.id);
        Test.stopTest();
		List<Account> afterDeleting = [Select Id From Account where Id =:a.Id];
        System.assertEquals(0, afterDeleting.size());
    }
    @isTest
    public static void testDeleteAccount(){

        Account a = new Account(Name = 'test');
        insert a;

        Test.startTest();
        	AccountManager.DeleteAccount(a);
        Test.stopTest();
		List<Account> afterDeleting = [Select Id From Account where Id =:a.Id];
        System.assertEquals(0, afterDeleting.size());
    }
    @isTest
    public static void testCreateAccount_1(){
        String name = 'testName';
        Test.startTest();
        	Account account = AccountManager.CreateAccount(name);
        Test.stopTest();
        
        List<Account> test = [SELECT Name FROM Account WHERE Name = :name];
        System.equals(1,test.size());
    }
    @isTest
    public static void testTestFuture_1(){
        
		string nt = '%' + 'SheduleTestJob' + '%';
		
        Test.startTest();
        	AccountManager.testFuture();
        Test.stopTest();
            
        List<Account> accounts = [SELECT Name FROM Account where Name like :nt];
        List<Account> allAccounts = [SELECT Name FROm Account];
        System.assertEquals(accounts.size(),allAccounts.size());
    }
    @isTest
    public static void testUpdateAccountNameById_1(){
        
        Account account = new Account(Name = 'test');
        insert account;
        
        Account testAccount = new Account(Name = 'acc');
        
        Test.startTest();
        	AccountManager.UpdateAccountNameById(account.id,testAccount.Name);
        Test.stopTest();
        
        System.equals(account.Name, testAccount.Name);
        
    }
    @isTest
    public static void testUpdateAccountName_1(){
        
        Account account = new Account(Name = 'test');
        insert account;
        
        String name = 'accTest';
        
        Test.startTest();
        	AccountManager.UpdateAccountName(name,account);
        Test.stopTest();
        
        System.equals(account.Name, name);
        
    }
    @isTest
    public static void testGetAccountsByName_1(){
        
        List<Account> newAccounts = new List<Account>{new Account(Name = 'testingNow'),new Account(Name = 'testingNow'),new Account(Name = 'testingNow')};
        insert newAccounts;
        
        Test.startTest();
        	List<Account> accounts = AccountManager.GetAccountsByName('testingNow');
        Test.stopTest();
        
        Integer counter = 0;
        for(Account acc : accounts){
            if(acc.Name == 'testingNow'){
                counter++;
            }
        }
        System.equals(counter, newAccounts.size());
        
    }
    @isTest
    public static void GetAccountWithTextInName_1(){
        
        List<Account> newAccounts = new List<Account>{new Account(Name = 'testingNow'),new Account(Name = 'testingNows'),new Account(Name = 'testingNow1')};
        insert newAccounts;
        
        Test.startTest();
        	List<Account> accounts = AccountManager.GetAccountWithTextInName('testingNow');
        Test.stopTest();
        
        Integer counter = 0;
        for(Account acc : accounts){
            if(acc.Name.Contains('testingNow')){
                counter++;
            }
        }
        System.equals(counter, newAccounts.size());
        
    }*/
}