({
    init:function(component, event, helper) {
        component.set('v.offset',0);
    },
    onProductsListChanged : function(component,event,helper){        
            let action = component.get('c.firstPage');
            $A.enqueueAction(action);
        },
    firstPage : function(component,event,helper){
        component.set('v.offset',0);
        let pageTurnedEvent = component.getEvent('pageTurnedEvent');
        pageTurnedEvent.setParam('offset',0);
        pageTurnedEvent.fire();

        },
        nextPage: function(component,event,helper){
            let offset = component.get('v.offset');
            let pageSize = component.get('v.pageSize');
            offset += pageSize;
            component.set('v.offset',offset);
            let pageTurnedEvent = component.getEvent('pageTurnedEvent');
            pageTurnedEvent.setParam('offset',offset);
            pageTurnedEvent.fire();

        },
        previousPage : function(component,event,helper){
            let offset = component.get('v.offset');
            let pageSize = component.get('v.pageSize');
            offset -= pageSize;
            component.set('v.offset',offset);

            let pageTurnedEvent = component.getEvent('pageTurnedEvent');
            pageTurnedEvent.setParam('offset',offset);
            pageTurnedEvent.fire();
        }
})