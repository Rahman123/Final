({
    aboutUsClicked : function(component, event, helper) {
        let mapOpenedEvent = component.getEvent('outletsMapOpened');
        mapOpenedEvent.setParam('flag',true);
        mapOpenedEvent.fire();
    },
    compareClicked : function(component, event, helper) {
        let compareOpenedEvent = component.getEvent('isCompareWindowOpenedEvent');
        compareOpenedEvent.setParam('flag',true);
        compareOpenedEvent.fire();
    },
    helpClicked : function(component, event, helper) {
        let helpOpenedEvent = component.getEvent('isCaseModalWindowOpenEvent');
        helpOpenedEvent.setParam('flag',true);
        helpOpenedEvent.fire();
    },
    currencySelected : function(component, event, helper) {
        let currencyChangedEvent = component.getEvent('currencyChangedEvent');
        let value = event.getParam('value');
        currencyChangedEvent.setParam('string',value);
        currencyChangedEvent.fire();
    }
})