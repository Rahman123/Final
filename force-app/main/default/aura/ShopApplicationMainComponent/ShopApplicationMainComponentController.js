({
  init: function(component, event, helper) {
    
  },
  setProducts: function(component, event, helper) {
    let filtersObj = event.getParam("filters");
    let operatorsObj = event.getParam("operators");
    let offset = event.getParam("offset");
    let limit = component.get("v.limits");

    let mapToSend = {};
    let mapToSend2 = {};
    for (var key of filtersObj.keys()) {
      mapToSend[key] = filtersObj.get(key);
    }
    for (var key of operatorsObj.keys()) {
      mapToSend2[key] = operatorsObj.get(key);
    }
    let action = component.get("c.getSortedProducts");
    action.setParams({
      filters: mapToSend,
      operators: mapToSend2,
      offset: offset,
      limits: limit
    });
    action.setCallback(this, function(response) {
      if (response.getState() === "SUCCESS") {
        component.set("v.productsList", response.getReturnValue());
      } else {
        alert("fail");
        alert(response.getError().toString);
      }
    });
    $A.enqueueAction(action);
  },
  showSelectedProduct: function(component, event, helper) {
    component.set("v.selectedProduct", event.getParam("product"));
    component.set("v.selectedProductPrice", event.getParam("productPrice"));
  },
  sendDataVFPage: function(component, event, helper) {
    if (component.get("v.productsList")) {
      var myEvent = $A.get("e.c:SendDataToVFEvent");
      myEvent.setParams({
        products: component.get("v.productsList")
      });
      myEvent.fire();
    }
  },
  closeOrderWindow: function(component, event, helper) {
    component.set("v.isOrderOpen", false);
  },
  changeCurrency : function(component, event, helper) {
    let action = component.get('c.getCurrencyRate');
    action.setParam('currencyName',event.getParam('string')); 
    action.setCallback(this,function(response){
      if(response.getState() === 'SUCCESS'){
        let curr = {'value':response.getReturnValue(),'label' : event.getParam('string')}
        component.set('v.currencyRate',curr);
      }
    });
    $A.enqueueAction(action);
  },
  turnPageEventHandler: function(component, event, helper) {
    let offset = event.getParam("offset");
    component.set("v.offset", offset);

    let sortingComponent = component.find("sortingComponent");
    sortingComponent.selectProducts(offset);
  },
  outletsMapOpenedEventHandler: function(component, event, helper) {
    component.set("v.isOutletsMapOpened", event.getParam("flag"));
  },
  isOrderWindowOpenedEventHandler: function(component, event, helper) {
    component.set("v.isOrderWindowOpened", event.getParam("flag"));
  },
  isCompareWindowOpenedEventHandler: function(component, event, helper) {
    component.set("v.isCompareWindowOpened", event.getParam("flag"));
  },
  addProductToCompareListEventHandler: function(component, event, helper) {
    let compareProducts = component.get("v.compareProductsList");
    compareProducts.push(event.getParam("product"));
  },
  removeProductFromCompareListEventHandler: function(component, event, helper) {
    let compareProducts = component.get("v.compareProductsList");
    compareProducts.splice(
      compareProducts.indexOf(event.getParam("product")),1
    );
    component.set("v.compareProductsList", compareProducts);
  },
  isCaseModalWindowOpenEventHandler: function(component, event, helper) {
    component.set("v.isCaseModalWindowOpen", event.getParam("flag"));
  }
});
