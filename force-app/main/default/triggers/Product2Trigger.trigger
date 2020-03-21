trigger Product2Trigger on Product2 (before insert, after insert, before update, after update,before delete, after delete) {
    Product2TriggerHandler handler = new Product2TriggerHandler();
    handler.run();
}