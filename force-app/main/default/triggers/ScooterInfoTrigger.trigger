trigger ScooterInfoTrigger on ScooterInfo__c (before insert, after insert, before update, after update,before delete, after delete) {
    ScooterInfoTriggerHandler handler = new ScooterInfoTriggerHandler();
    handler.run();
}