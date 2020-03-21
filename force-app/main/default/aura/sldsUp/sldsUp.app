<aura:application extends="force.slds" >
    
    <aura:handler name = "onBadgeHidden" event = "c:onBadgeHidden" action = "onHidden" />
    
    <c:sldsTest />
    <c:childWithMethod />
    <lightning:button label = "hide" onclick = "{!c.hideBadgeAction}" />
    
    <c:ldsDtSvActVw accountId = "0012v00002f1yYoAAI/"/>
</aura:application>