({
    sort : function(component, event, helper) {
      let compEvent = component.getEvent('FiltersApplyed');

      const name = component.get('v.name');    
      const maxPrice = component.get('v.maxPrice');      
      const catigory = component.get('v.catigory');      
      const distance = component.get('v.maxDistance');      
      
       let filters = new Map();
       let operators = new Map();

       filters.set('Name',name);
       filters.set('maxPrice',maxPrice);
       filters.set('Catigory__c',catigory);
       filters.set('TravelDistance__c',distance);
      
        operators.set('Name','LIKE');
        operators.set('maxPrice','<=');
        operators.set('Catigory__c','LIKE');
        operators.set('TravelDistance__c','<=');

       compEvent.setParams({
         'filters':filters,
         'operators' : operators,
         'offset' : 0
       });
       compEvent.fire();
    },
    getFilterForTurnPage : function(component, event, helper) {
      let compEvent = component.getEvent('FiltersApplyed');
      let offset = event.getParam('arguments').offset;
      const name = component.get('v.name');    
      const maxPrice = component.get('v.maxPrice');      
      const catigory = component.get('v.catigory');      
      const distance = component.get('v.maxDistance');      
      
       let filters = new Map();
       let operators = new Map();

       filters.set('Name',name);
       filters.set('maxPrice',maxPrice);
       filters.set('Catigory__c',catigory);
       filters.set('TravelDistance__c',distance);
        
        operators.set('Name','LIKE');
        operators.set('maxPrice','<=');
        operators.set('Catigory__c','LIKE');
        operators.set('TravelDistance__c','<=');

       compEvent.setParams({
         'filters':filters,
         'operators' : operators,
         'offset' : offset
       });
       compEvent.fire();
    }
})