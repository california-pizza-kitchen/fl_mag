$(document).ready(function(){

  $("body").on("click", ".publish", function(event){
    event.preventDefault();

    var entry_slug_data = {
      slug: $(this).data("entry-slug")
    }

    $.post('/entries/publish', entry_slug_data, function(){});

    $(this).removeClass("btn-success");
    $(this).addClass("btn-warning");
    $(this).text("Published!");

  });
});