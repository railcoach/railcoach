var loginPopup = {
  init: function() {
          $('#login_link').click(function(event) {
            event.preventDefault();
            var content = $.ajax({
              url: '/users/sign_up.js',
              type: 'GET',
              success: function(data) {
                console.log(data);
                console.log("Success called");
                if(!$('.ui-dialog').length > 0) {
                  $(data).dialog({"width": 320, "title": "Choose your network", close: function(events,ui) { $(this).remove(); }});
                }
              }
            });
          });
        }
}
