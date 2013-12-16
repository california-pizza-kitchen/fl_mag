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


  $(".tag-generate").submit(function(event){
    var postData = $(this).serializeArray();
    var formURL = $(this).attr("action");
    var id = "#tags-list-" + postData[3].value;

    $.ajax(
    {
      url : formURL,
      type: "post",
      data: postData,
      success:function(data, textStatus, jqXHR) 
        {
          var btnHtml = "<button type='button' class='btn btn-warning btn-sm'>" + data.tag_word + "</button> ";
          $(id).append(btnHtml);
        },
      error: function(jqXHR, textStatus, errorThrown) 
        {
            console.log(errorThrown);    
        }
    });

    event.preventDefault();
  });

  // Tweet Character Counter
  var title; 
  var twitter_handle; 
  var blogpost_url;
  var tweet_string;
  var char_count;
  var max_count = 117 //maximum count 140 char minus 22 char for url shortener

  function check_character_count(char_count) {
    var remaining_char = max_count - char_count;

    if (char_count < max_count) {
      $('#count').removeClass('red_text')
      .addClass('green_text')
      .text('remaining '+remaining_char);
      $('#tweet-submit')[0].disabled = false;
      $('#tweet-submit').removeClass('disabled').addClass('btn-success');
      return true;
    } else {
      $('#count').removeClass('green_text')
      .addClass('red_text')
      .text(remaining_char);
      $('#tweet-submit')[0].disabled = true;
      $('#tweet-submit').removeClass('btn-success').addClass('disabled');
      return false;
    }
  }

  $('#updated-tweet-data').focus(function(){
    $(document).on('keyup', function(){
      blogpost_url = " http://"+window.location.host+""+ $(this).parent(".entry").find(".blogpost_url").attr("href"); 
      char_count = $('#updated-tweet-data').val().length - blogpost_url.length;
      console.log(blogpost_url.length);
      console.log($('#updated-tweet-data').val().length);
      check_character_count(char_count);
    });
  });

  // count tweet_string and display number with every key-up event
  // prevent ajax post if tweet_string (without the url) is > 117 characters

  $(".tweet").click(function(){
   	title = '"'+$(this).parent(".entry").find("h1").text()+'"'; 
   	twitter_handle = $(this).parent(".entry").find(".twitter_handle").html(); 
   	blogpost_url = " http://"+window.location.host+""+ $(this).parent(".entry").find(".blogpost_url").attr("href"); 
   	tweet_string = title+ "- Guest post by student " + twitter_handle + blogpost_url; 

   	$("#updated-tweet-data").val(tweet_string);

    char_count = tweet_string.length - blogpost_url.length;
    check_character_count(char_count);
   	//console.log(data);

   	$('.tweet_msg').text(tweet_string);

   	//show modal
   	$('#tweet').modal({
   		show: true
   	});
  });

	$("#tweet-submit").on('click', function(event) {

    var blogpost_url = " http://"+window.location.host+""+ $(this).parent(".entry").find(".blogpost_url").attr("href"); 
    var char_count = $('#updated-tweet-data').val().length - blogpost_url.length;
    var remaining_char = max_count - char_count;

    var data = { tweet: $("#updated-tweet-data").val()};
    
    if (check_character_count(char_count)) {
			$.post('/users/tweet', data, function(return_data){});
    } 
    event.preventDefault();

 	}); //end form submit

});