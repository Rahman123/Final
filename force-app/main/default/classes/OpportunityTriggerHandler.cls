public class OpportunityTriggerHandler extends TriggerHandler{
    
    public override void beforeInsert(){
        List<Opportunity> opportunities = (List<Opportunity>)Trigger.new;
        for (Opportunity item : opportunities) {
            item.Pricebook2Id = CONST_Pricebooks.SCOOTERS_PRICEBOOK_ID_CONST;
        }
    }

}
