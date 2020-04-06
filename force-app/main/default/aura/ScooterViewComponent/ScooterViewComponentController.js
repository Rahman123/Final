({
  productSelectedHandler: function(component, event, helper) {
    let product = component.get("v.product");
    let productPrice = component.get("v.productPrice");
    let productSelectedEvent = component.getEvent("productSelected");
      productSelectedEvent.setParam("product", product);
      productSelectedEvent.setParam("productPrice", productPrice);
      productSelectedEvent.fire();
  }
});
