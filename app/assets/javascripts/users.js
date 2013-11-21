$(document).ready(function(){

  $("#publish").click(function){
    $.post('/entries/publish')
  }

});