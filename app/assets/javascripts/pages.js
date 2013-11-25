$( document ).ready(function() {



    $("#about").click(function(){
      $(".jumbotron").fadeOut(500,function(){
        $("#jumbo-title").text("curated from current students and alumni.");
        $("#jumbo-body").text("“when you don't create things, you become defined by your tastes rather than ability. your tastes only narrow & exclude people. so create.” ― Why The Lucky Stiff");
      });

      $(".jumbotron").fadeIn(1000);
    });



});

