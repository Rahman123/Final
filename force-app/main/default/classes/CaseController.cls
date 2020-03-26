public with sharing class CaseController {
    
    @AuraEnabled
    public static void submitCase(String email, String subject, String description){
        Case newCase = new Case(
            SuppliedEmail = email,
            Subject = subject,
            Description = description
        );
        CaseManager.insertCase(newCase);
    }

}
