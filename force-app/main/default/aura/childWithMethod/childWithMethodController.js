({
	myAction : function(component, event, helper) {
		component.set("v.showBadge", false);
	},
    
    /*hiddenBadgeEven : function(component,event,helper){
    component.set("v.showBadge",false);
    
    const evt = component.get("onBadgeHidden");
    evt.setParam('Message',"Hi");
    evt.fire();
	} */
})