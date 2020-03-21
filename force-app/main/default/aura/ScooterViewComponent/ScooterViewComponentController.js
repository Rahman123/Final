({
    productSelectedHandler : function(component, event, helper) {
        let product = component.get('v.product');
        let productPrice = component.get('v.productPrice');
        let productSelectedEvent = component.getEvent('productSelected');
        productSelectedEvent.setParam('product',product);
        productSelectedEvent.setParam('productPrice',productPrice);
        productSelectedEvent.fire();
    },
    doInit : function(component, event, helper) {
        let product = component.get('v.product');
        component.set('v.productPrice',product.PricebookEntries[0].UnitPrice);        
    }
})