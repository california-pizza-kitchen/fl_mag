$( document ).ready(function() {



    $("#about").click(function(){
      // if (".")
      $(".full-content").fadeOut(500, function(){
        $(".about-content").fadeIn(1000);
      });
    }); 

    // $("#magazine").click(function(){
    //   $(".about-content").fadeOut(300, function(){
    //   $(".full-content").fadeIn(400);
    //   });
    // });
});