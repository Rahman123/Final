public class AccountManagerses {
    public AccountManagerses() {
            Account account = [SELECT Id FROM Account];
            System.debug(account);
    }
}