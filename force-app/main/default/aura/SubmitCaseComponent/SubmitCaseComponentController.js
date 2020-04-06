({
    submit: function(component, event, helper) {
        component.set('v.isSpinnerActive',true);
        const email = component.get('v.email');
        const subject = component.get('v.subject');
        const description = component.get('v.description');
    
        const action = component.get('c.submitCase');
        action.setParams({
          email: email,
          subject: subject,
          description: description
        });
        action.setCallback(this,function(response){
            let state = response.getState();
            if(state === 'SUCCESS'){
                // вынести в helper
                let successEvent = component.getEvent('sendCaseState');
                successEvent.setParam('string','Success');
                successEvent.fire();
            }else{
                let successEvent = component.getEvent('sendCaseState');
                successEvent.setParam('string','Success');
                successEvent.fire();
            }
            component.set('v.isSpinnerActive',false);
        })
        $A.enqueueAction(action);
      }
})
