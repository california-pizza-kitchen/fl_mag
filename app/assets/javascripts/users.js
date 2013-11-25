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

  $("body").on("click", ".tag", function(event){
    event.preventDefault();

    var entry_tag_data = {
      tag_id: $(this).data("entry-tag-id"),
      entry_id: $(this).data("entry-id")
    }

    $.post('/entries/tag', entry_tag_data, function(){});

    $(this).removeClass("btn-success");
    $(this).addClass("btn-warning");

  });
});