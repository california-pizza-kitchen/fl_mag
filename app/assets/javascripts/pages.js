$( document ).ready(function() {



    $("#about").click(function(){
      $(".full-content").fadeOut(500, function(){
        $(".about-content").fadeIn(1000);
      });
    });



});

