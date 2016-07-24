$(document).ready(function(){
  $("#imperial").hide();
  $('#weight_unit').change(function(){
    if (this.value == "Imperial")
      {
        $("#metric").hide();
        $("#imperial").show();
      }
    else
      {
        $("#imperial").hide();
        $("#metric").show();
      }      
  });

 $("#profileDropDown").hide();
  $("#allProfiles").removeClass("hidden");
  var selectTag = $("#message_receiver_id");
  var clickProfile = function(profile, profileId, customerId){
    profileId.click(function(){
      selectTag.val(customerId).change();
    });
  };
    
  for (var i = 0; i < profileIds.length; i++) {
    var profile = profileIds[i];
    var profileId = $(profile.id);
    var customerId = profile.customer_id;
    clickProfile(profile, profileId, customerId);
  }
});
