({
    init:function(component, event, helper) {

         
         let action = component.get('c.getProducts');
         
         action.setCallback(this, function(response){
             component.set('v.products',response.getReturnValue());
            });
            $A.enqueueAction(action);
            
    },
    checkValue : function(component, event, helper) {
            component.set("v.isSimple",false);
    },

    calculate : function(component, event, helper){
        const number = component.get('v.number');
        for(let i = 2; i <= number/2; i++){ 
            if((number % i) == 0){
                component.set('v.isSimple', false);
                helper.Show($A.get('$Label.c.NumberIsNotSimpleMessage'),$A.get('$Label.c.EForceEventTitle'));
                return;
            }
        }
        component.set("v.isSimple", true);
    }
})