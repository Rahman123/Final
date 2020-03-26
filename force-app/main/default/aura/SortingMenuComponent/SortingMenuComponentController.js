({
    sort : function(component, event, helper) {
      helper.fireFilterEvent(component,0);
    },
    getFilterForTurnPage : function(component, event, helper) {
      let offset = event.getParam('arguments').offset;
      helper.fireFilterEvent(component,offset);
    }
})