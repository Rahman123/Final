({
    doInit : function(component, event, helper) {
        let getDeliveryTypesAction = component.get('c.getDeliveryTypesValues');
        let deliveryTypes = [];
        getDeliveryTypesAction.setCallback(this,function(response){
            if(response.getState() === 'SUCCESS'){
                let answer = response.getReturnValue();
                deliveryTypes.push({key:'None',value:'None'});
                for(let key in answer){
                    deliveryTypes.push({key:key, value: answer[key]});
                }
                component.set('v.deliveryTypes',deliveryTypes);
            }
        });
        $A.enqueueAction(getDeliveryTypesAction);
        let deliveryPoints = [];
        let getOutletPointsAction = component.get('c.getRelatedOutlets');
        getOutletPointsAction.setCallback(this,function(response){
            if(response.getState() === 'SUCCESS'){
                let answer = response.getReturnValue();
                deliveryPoints.push({key:'None',value:'None'});
                for(let key in answer){
                    deliveryPoints.push({key:key, value: answer[key]});
                }
                component.set('v.outlets',deliveryPoints);
            }
        });
        $A.enqueueAction(getOutletPointsAction);
    }, 
    closeWindow : function (component,event,helper){
        let windowEvent = component.getEvent('isOrderWindowOpenedEvent');
        windowEvent.setParam('flag',false);
        windowEvent.fire();
    },
    setAddress : function (component,event,helper){
        component.set('v.streetAttr',component.find('addressFields').get('v.street'));
        component.set('v.cityAttr',component.find('addressFields').get('v.city'));
    },
    onOutletFieldChanged : function (component,event,helper){
        let selectedOutlet = component.find('outletField').get('v.value');
        component.set('v.selectedOutlet',selectedOutlet);
    },
    onDeliveryTypesChanged : function (component,event,helper){
        let selectedDeliveryType = component.find('deliveryTypeChoise').get('v.value');
        component.set('v.streetAttr','');
        component.set('v.selectedOutlet','');
        component.set('v.cityAttr','');
        component.set('v.postCodeAttr','');
        component.set('v.selectedDeliveryType',selectedDeliveryType);
    },
    orderProductsMethod : function(component,event,helper){
        
        let product = component.get('v.product');
        let price = component.get('v.productPrice');
        let lastName = component.get('v.lastNameAttr');
        let firstName = component.get('v.firstNameAttr');
        let email = component.get('v.emailAttr');
        let phone = component.get('v.phoneAttr');
        let deliveryType = component.get('v.selectedDeliveryType');

        if(deliveryType == 'Pickup'){            
            let outlet = component.get('v.selectedOutlet');
            let action = component.get('c.orderProductsPickup');    
            action.setParams({
                'lastName' : lastName,
                'firstName' : firstName,
                'email' : email,
                'phone' : phone,
                'product' : product,
                'price' : price,
                'deliveryType' : deliveryType,
                'outletId' : outlet
            });
            $A.enqueueAction(action);
        }else if(deliveryType == 'Courier'){
            let city =  component.get('v.cityAttr');
            let street =  component.get('v.streerAttr');
            let country =  component.find('addressFields').get('v.country');
            let action = component.get('c.orderProductsCourier');
            action.setParams({
                'lastName' : lastName,
                'firstName' : firstName,
                'email' : email,
                'phone' : phone,
                'product' : product,
                'price' : price,
                'deliveryType' : deliveryType,
                'street' : street,
                'city' : city,
                'country' : country
            });
            $A.enqueueAction(action);
        }else if(deliveryType == 'Post'){
            let postCode = component.find('postCodeField').get('v.value');
            let action = component.get('c.orderProductsPost');
            action.setParams({
                'lastName' : lastName,
                'firstName' : firstName,
                'email' : email,
                'phone' : phone,
                'product' : product,
                'price' : price,
                'deliveryType' : deliveryType,
                'postCode' : postCode
            });
            $A.enqueueAction(action);
        }
        let windowEvent = component.getEvent('isOrderWindowOpenedEvent');
        windowEvent.setParam('flag',false);
        windowEvent.fire();
    }
})
