<aura:application extends = "force:slds">
    <aura:attribute name = "appAttribute" type = "String" default = "Text"/>
   	<lightning.input name = "inputText" label = "Enter text" value = "{!v.appAttribute}"/>
    <lightning:button name = "button" label = "Clear" onclick= "{!c.clear}"/>
    <c:TestPage badgeLabel ="Bage attribute label"/>
    <c:TestPage badgeLabel ="{!v.appAttribute}"/>
</aura:application>