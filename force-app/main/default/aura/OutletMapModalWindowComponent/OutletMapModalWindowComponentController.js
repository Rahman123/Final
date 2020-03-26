({
    closeModel: function(component, event, helper) {
       let mapOpenedEvent = component.getEvent('outletsMapOpened');
        mapOpenedEvent.setParam('flag',false);
        mapOpenedEvent.fire();
    }
 })