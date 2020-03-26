({
    removeFromCompare : function(component,event,helper){
        let windowEvent = component.getEvent('removeProductFromCompareListEvent');
        windowEvent.setParam('product',component.get('v.product'));
        windowEvent.fire();
     },
     orderProductClicked : function(component,event,helper){
        let product = component.get("v.product");
    
        let productSelectedEvent = component.getEvent("productSelected");
        productSelectedEvent.setParam("product", product);
        productSelectedEvent.fire();

        let compareWindowOpenedEvent = component.getEvent('isCompareWindowOpenedEvent');
        compareWindowOpenedEvent.setParam('flag',false);
        compareWindowOpenedEvent.fire();

        let windowEvent = component.getEvent('isOrderWindowOpenedEvent');
        windowEvent.setParam('flag',true);
        windowEvent.fire();
     }
})
