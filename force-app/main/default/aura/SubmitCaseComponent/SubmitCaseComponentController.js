({
    submit : function(component, event, helper) {
        const email = component.get('v.email');
        const subject = component.get('v.subject');
        const body = component.get('v.body');

        const action = component.get('c.submitCase');
        action.setParams({
            'email' : email,
            'subject': subject,
            'body' : body
        })
        action.setCallback(this,function(response){

        });
        $A.enqueueAction(action);
    }
})
