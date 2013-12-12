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

  // Tweet Character Counter

  // var max_count = 117 //maximum count 140 char minus 22 char for url shortener
  // var allow_submit = true;
  // $('#updated-tweet-data').focus(function(){
  //     $(document).keyup(function(){
  //         var blogpost_url = " http://"+window.location.host+""+ $(this).parent(".entry").find(".blogpost_url").attr("href"); 
  //         // alert(blogpost_url.length);
  //         var char_count = $('#updated-tweet-data').val().length - blogpost_url.length;
  //         var remaining_char = max_count - char_count;
          
  //         // if (char_count < max_count) {
  //         //   $('#count').removeClass('red_text')
  //         //   .addClass('green_text')
  //         //   .text('remaining '+remaining_char);
  //         //   allow_submit = true;
  //         // } else {
  //         //   allow_submit = false;
  //         //   $('#count').removeClass('green_text')
  //         //   .addClass('red_text')
  //         //   .text(remaining_char);
  //         // }
  //     });
  // });


  // count tweet_string and display number with every key-up event
  // prevent ajax post if tweet_string (without the url) is > 117 characters

  $(".tag-generate").submit(function(event){
    var postData = $(this).serializeArray();
    var formURL = $(this).attr("action");

    $.ajax(
    {
      url : formURL,
      type: "post",
      data: postData,
      success:function(data, textStatus, jqXHR) 
        {
          var btnHtml = "<button type='button' class='btn btn-warning btn-sm'>" + data.tag_word + "</button> ";
          $(".tags-list").append(btnHtml);
        },
      error: function(jqXHR, textStatus, errorThrown) 
        {
            console.log(errorThrown);    
        }
    });

    event.preventDefault();
  });

// <button type="button" class="btn btn-primary btn-sm tag" data-entry-id="<%= entry.id %>" data-entry-tag-id="<%= entry_tag.tag.id %>"><%= entry_tag.tag.display_word_or_word %></button>


$("#ajaxform").submit(function(e)
  {
      var postData = $(this).serializeArray();
      var formURL = $(this).attr("action");
      $.ajax(
      {
          url : formURL,
          type: "POST",
          data : postData,
          success:function(data, textStatus, jqXHR) 
          {
              //data: return data from server
          },
          error: function(jqXHR, textStatus, errorThrown) 
          {
              //if fails      
          }
      });
      e.preventDefault(); //STOP default action
  });


  // $(".tweet").click(function(){
  //  	var title = '"'+$(this).parent(".entry").find("h1").text()+'"'; 
  //  	var twitter_handle = $(this).parent(".entry").find(".twitter_handle").html(); 
  //  	var blogpost_url = " http://"+window.location.host+""+ $(this).parent(".entry").find(".blogpost_url").attr("href"); 
  //  	var tweet_string = title+ "- Guest post by student " + twitter_handle + blogpost_url; 

  //  	$("#updated-tweet-data").val(tweet_string);
  //  	$('.tweet_msg').text(tweet_string);

  //  	//show modal
  //  	$('#tweet').modal({
  //  		show: true
  //  	});

  // 	$("#tweet-submit").click(function(event) {
  //     var data = { tweet: $("#updated-tweet-data").val()};
  //  			$.post('/users/tweet', data, function(return_data){
  //     }
 	// 		event.preventDefault();
 	// 	}); //end form submit

  // });
});