({
    orderProductClicked : function(component,event,helper){
        let windowEvent = component.getEvent('isOrderWindowOpenedEvent');
        windowEvent.setParam('flag',true);
        windowEvent.fire();
     },
     addToCompareClicked : function(component,event,helper){
        let windowEvent = component.getEvent('addProductToCompareListEvent');
        windowEvent.setParam('product',component.get('v.product'));
        windowEvent.setParam('productPrice',component.get('v.productPrice'));
        windowEvent.fire();
     }
})
