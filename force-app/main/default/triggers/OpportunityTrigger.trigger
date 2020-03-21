trigger OpportunityTrigger on Opportunity (before insert) {
    OpportunityTriggerHandler handler = new OpportunityTriggerHandler();
    handler.run();
}