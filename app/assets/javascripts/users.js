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


  // Tweet Character Counter

  var max_count = 117 //maximum count 140 char minus 22 char for url shortener

  $('#updated-tweet-data').focus(function(){
      $(document).keyup(function(){
          var blogpost_url = " http://"+window.location.host+""+ $(this).parent(".entry").find(".blogpost_url").attr("href"); 
          // alert(blogpost_url.length);
          var char_count = $('#updated-tweet-data').val().length - blogpost_url.length;
          var remaining_char = max_count - char_count;
          
          if (char_count < max_count) {
            $('#count').removeClass('red_text')
            .addClass('green_text')
            .text('remaining '+remaining_char);
          } else {
            $('#count').removeClass('green_text')
            .addClass('red_text')
            .text(remaining_char);
          }
      });
  });


  // count tweet_string and display number with every key-up event
  // prevent ajax post if tweet_string (without the url) is > 117 characters

  $(".tweet").click(function(){
   	var title = '"'+$(this).parent(".entry").find("h1").text()+'"'; 
   	var twitter_handle = $(this).parent(".entry").find(".twitter_handle").html(); 
   	var blogpost_url = " http://"+window.location.host+""+ $(this).parent(".entry").find(".blogpost_url").attr("href"); 
   	var tweet_string = title+ "- Guest post by student " + twitter_handle + blogpost_url; 

   	$("#updated-tweet-data").val(tweet_string);

   	//console.log(data);

   	$('.tweet_msg').text(tweet_string);

   	//show modal
   	$('#tweet').modal({
   		show: true
   	});

  	$("#tweet-submit").click(function(event) {

   			console.log(data);

        var data = { tweet: $("#updated-tweet-data").val()};

   			$.post('/users/tweet', data, function(return_data){

   				//$('#tweet').modal('hide');
   				console.log(return_data);
   			});

   			event.preventDefault();

   		}); //end form submit

    // $.post('/entries/tweet', entry_slug_data, function(){});

    // $(this).removeClass("btn-success");
    // $(this).addClass("btn-warning");
    // $(this).text("Tweeted!");


  });
});