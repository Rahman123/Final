({
    doInit : function(component, event, helper) {
        let action = component.get('c.getAllOutlets');
        let markers = [];
        action.setCallback(this,function(response){
            let answer = response.getReturnValue();
            for (let i = 0; i < answer.length; i++){
                let outlet = answer[i];
                let description ='Address :' + outlet.City__c + ' ' + outlet.Street__c + ' ' +
                                'Phone number: ' + outlet.PhoneNumber__c + '\n' +
                                'Email:  ' + outlet.Email__c + '\n' +
                                'Open time:  ' + $A.localizationService.formatTime(outlet.OpenTime__c, 'hh:mm a') + '\n' +
                                'Close time: ' + $A.localizationService.formatTime(outlet.CloseTime__c,'hh:mm a') + '\n';
                markers.push({
                    location:{
                        'City' : outlet.City__c,
                        'Street' : outlet.Street__c,
                        'Latitude' : outlet.Location__Latitude__s,
                        'Longitude' : outlet.Location__Longitude__s
                    },
                    title : outlet.Name,
                    description : description,
                    icon: 'custom:custom92'
                })
                
            }
            component.set('v.mapMarkers',markers);
            
        });
        $A.enqueueAction(action);
    }
})
