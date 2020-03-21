public class ScooterInfoTriggerHandler extends TriggerHandler{
    
    public override void afterDelete(){
        
        // List<ScooterInfo__c> info = (List<ScooterInfo__c>)trigger.Old;
        // List<SObject> obj = new List<SObject>();
        
        // for (ScooterInfo__c temp: info) {
        //     if(temp.ScooterStructureId__c != null){
        //         List<ScooterStructure__c> structures = [SELECT Name FROM ScooterStructure__c WHERE Id =: temp.ScooterStructureId__c];
        //         obj.addAll(structures);
        //     }
        //     if(temp.ScooterDimensionsAndWeightId__c != null){
        //         List<ScooterDimensionsAndWeight__c> demensions = [SELECT Name FROM ScooterDimensionsAndWeight__c WHERE Id =: temp.ScooterDimensionsAndWeightId__c];
        //         obj.addAll(demensions);
        //     }
        //     if(temp.ScooterDimensionsAndWeightId__c != null){
        //         List<ScooterEquipment__c> equipment = [SELECT Name FROM ScooterEquipment__c WHERE Id =: temp.ScooterEquipmentId__c];
        //         obj.addAll(equipment);
        //     }
        // }
        // if(obj.size() > 0)
        //     delete obj;

    }

}