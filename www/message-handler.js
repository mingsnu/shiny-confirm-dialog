(function() {
// This recieves messages of type "dialogContentUpdate" from the server.
Shiny.addCustomMessageHandler("dialogContentUpdate",
  function(data) {
    $('#' + data.id).find(".modal-body").html(data.message);
  }
);
})();
