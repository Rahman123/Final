({
    fireFilterEvent : function(component,offset){
    let compEvent = component.getEvent('FiltersApplyed');

      let name = component.get('v.name');    
      if(name != undefined){
        name = name.trim();
      }
      const maxPrice = component.get('v.maxPrice');      
      let catigory = component.get('v.catigory');      
      if(catigory != undefined){
        catigory = catigory.trim();
      }
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