({
    Show : function(messageText, titleText) {
        let toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
                "title": titleText,
                "message": messageText});
        toastEvent.fire();
    }
})