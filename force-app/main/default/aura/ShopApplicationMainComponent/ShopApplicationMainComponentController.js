({
    init:function(component, event, helper) {
        let action = component.get('c.getAllProducts');
        let countProductsAction = component.get('c.countProducts');
        countProductsAction.setCallback(this,function(response){

        });
        action.setCallback(this,function(response){
            component.set('v.productsList',response.getReturnValue());
        });
        $A.enqueueAction(action);
        
    },
    setProducts : function(component,event,helper){
        let filtersObj = event.getParam('filters');
        let operatorsObj = event.getParam('operators');
        let offset = event.getParam('offset');
        let limit = component.get('v.limits');
        
        let mapToSend = {};
        let mapToSend2 = {};
        for (var key of filtersObj.keys()) {
            mapToSend[key] = filtersObj.get(key);
        }
        for (var key of operatorsObj.keys()) {
            mapToSend2[key] = operatorsObj.get(key);
        }
        let action = component.get('c.getSortedProducts');
        action.setParams({
            "filters": mapToSend,
            "operators":mapToSend2,
            "offset" : offset,
            "limits" : limit
        });
       
        action.setCallback(this,function(response){
            if(response.getState() === 'SUCCESS'){                
                component.set('v.productsList',response.getReturnValue());
            }else{
                alert('fail');
                alert(response.getError().toString);
            }
        });
        $A.enqueueAction(action);
    },
    showSelectedProduct : function(component,event,helper){
            component.set('v.selectedProduct',event.getParam('product'));
            component.set('v.selectedProductPrice',event.getParam('productPrice'));
            alert(component.get('v.selectedProductPrice'));

    },
    closeOrderWindow : function(component,event,helper){
        component.set('v.isOrderOpen',false);
    },
    turnPageEventHandler : function(component,event,helper){
        let offset = event.getParam('offset');
        component.set('v.offset',offset);

        let sortingComponent = component.find('sortingComponent');
        sortingComponent.selectProducts(offset);
    }
})