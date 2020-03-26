({
  init: function(component, event, helper) {
    component.set("v.offset", 0);
    helper.firePageTurnedEvent(component, 0);
  },
  onProductsListChanged: function(component, event, helper) {
    let action = component.get("c.firstPage");
    $A.enqueueAction(action);
  },
  firstPage: function(component, event, helper) {
    component.set("v.offset", 0);
    helper.firePageTurnedEvent(component, 0);
  },
  nextPage: function(component, event, helper) {
    let offset = component.get("v.offset");
    let pageSize = component.get("v.pageSize");
    offset += pageSize;
    component.set("v.offset", offset);
    helper.firePageTurnedEvent(component, offset);
  },
  previousPage: function(component, event, helper) {
    let offset = component.get("v.offset");
    let pageSize = component.get("v.pageSize");
    offset -= pageSize;
    component.set("v.offset", offset);
    helper.firePageTurnedEvent(component, offset);
  }
});
