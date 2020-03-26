({
    submit : function(component, event, helper) {
        const email = component.get('v.email');
        const subject = component.get('v.subject');
        const description = component.get('v.description');

        const action = component.get('c.submitCase');
        action.setParams({
            'email' : email,
            'subject': subject,
            'description' : description
        });
        $A.enqueueAction(action);

        let caseWindow = component.getEvent('isCaseModalWindowOpenEvent');
        caseWindow.setParam('flag',false);
        caseWindow.fire();

        component.set('v.email','');
        component.set('v.subject','');
        component.set('v.description','');

    },
    closeWindow : function(component,event,helper){
        let caseWindow = component.getEvent('isCaseModalWindowOpenEvent');
        caseWindow.setParam('flag',false);
        caseWindow.fire();
    }
})
