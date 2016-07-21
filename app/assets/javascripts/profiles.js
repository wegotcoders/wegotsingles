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
});
