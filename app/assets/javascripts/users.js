$(document).ready(function(){

  $(".publish").click(function(){
    var entry_slug_data = {
      slug: $(this).data("entry-slug")
    }

    $.post('/entries/publish', entry_slug_data, function(){});

    $(this).removeClass("btn-success");
    $(this).addClass("btn-warning");
    $(this).text("Published!");

  });


  $(".tweet").click(function(){
    var entry_slug_data = {
      slug: $(this).data("entry-slug")
    }

    $.post('/entries/tweet', entry_slug_data, function(){});

    $(this).removeClass("btn-success");
    $(this).addClass("btn-warning");
    $(this).text("Tweeted!");

  });
});