({
	init : function(component, event, helper) {

        let sObjectNamevar = component.get('v.sObjectName');
        let currentRecordId = component.get('v.recordId');
        let isFlowEnabled;

        if(sObjectNamevar  == $A.get('$Label.c.sObjectAccount') && !currentRecordId)
        {
            let flow = component.find('FastContactFlow');
            flow.startFlow('Contacts_and_Emails',recordId);
            isFlowEnabled = true;
        }else
        {
            isFlowEnabled = false;
        }   
        component.set('v.isFlowEnabled',isFlowEnabled);
    }
})