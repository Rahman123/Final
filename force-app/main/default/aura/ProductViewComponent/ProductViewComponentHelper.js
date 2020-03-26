({
    firePageTurnedEvent : function(component,offset) {
        let pageTurnedEvent = component.getEvent('pageTurnedEvent');
            pageTurnedEvent.setParam('offset',offset);
            pageTurnedEvent.fire();
    }
})