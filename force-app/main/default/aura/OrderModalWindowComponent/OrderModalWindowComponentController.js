({
    myAction : function(component, event, helper) {

    }, 
    closeWindow : function (component,event,helper){
        component.set('v.isWindowOpen',false);
    },
    orderProducts : function(component,event,helper){
        let lastName = component.get('v.lastNameAttr');
        let firstName = component.get('v.firstNameAttr');
        let product = component.get('v.product');
        let email = component.get('v.emailAttr');
        let phone = component.get('v.phoneAttr');
        component.set('v.isWindowOpen',false);
        let action = component.get('c.orderProducts');
        action.setParams({
            products:product,
            opportunityName:"test",
            email:email,
            phone:phone,
            lastName:lastName,
            firstName:firstName
        });
        $A.enqueueAction(action);
    }
})
