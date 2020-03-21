({
    getAccounts : function() {
        let action = component.get('c.getAllProducts');
        action.setCallback(this,function(response){
            component.set('v.productsList',response.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})