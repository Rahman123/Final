({
    myAction : function(component, event, helper) {

    },
    orderProductClicked : function(component,event,helper){
        let product = component.get('v.product');
        let products = [];
        products.push(product);
        products.push(product);
        let action = component.get('c.OrderRequest');
        action.setParams({
            products:products,
            opportunityName:"testLightng",
            lastName:'testOpp',
            firstName:'testOpp',
            email:'test@t.t',
            phone:'111221234567'
        });
        action.setCallback(this,function(response){
            if(response.getState() === 'SUCCESS'){
                alert('opp created(or not?)');
            }else{
                alert('fail');
            }
        })
        $A.enqueueAction(action);    }
})
