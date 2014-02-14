$(document).ready(function(){

  // create student form validation 
  function validateStudentFields() {
    var bloggerName = $('#blogger_name').val();
    var bloggerUrl = $('#blogger_feed_url').val();
    var bloggerTwitterHandle  = $('#blogger_twitter_handle').val();
    if(bloggerName == '' || bloggerName == null) {
      $('#blogger_name').addClass('form-error');
      $('#blogger_name').val('name can\'t be blank');
      return true;
    };

    if(bloggerUrl.indexOf("http://") != 0) {
      $('#blogger_feed_url').addClass('form-error');
      $('#blogger_feed_url').val('must start with http://');
      return true;
    }

    if(bloggerTwitterHandle != '' && bloggerTwitterHandle != null) {
      if(bloggerTwitterHandle.indexOf('@') == -1) {
        $('#blogger_twitter_handle').addClass('form-error');
        $('#blogger_twitter_handle').val('must start with @');
        return true;
      }
    }
  };

  // reset input values
  $('#blogger_name, #blogger_feed_url, #blogger_twitter_handle, #school_session_name').click(function() {
    if($(this).hasClass('form-error')) {
      $(this).removeClass('form-error');
      $(this).val('');
    };
  });

  // apply validations to submit
  $('#new_blogger').submit(function(event) {
    if(validateStudentFields() ){
      event.preventDefault();
    }
  });

  // validation for school session
  function newSchoolValiate() {
    var inputVal = $('#school_session_name').val();
    if(inputVal == '' || inputVal == null){
      $('#school-session-name').addClass('form-error');
      $('#school-session-name').val('can\'t be blank');
    }
  };

  $('#new_school_session').submit(function(event) {
    alert('yea');
    if(newSchoolValidate() ){
      event.preventDefault();
    }
  });

  // browse entries from dashboard dropdown
  $('.entry-browse-wrapper select').each(function(){
    $(this).prop("selectedIndex", -1);
  });

  $('.session-dropdown').change(function(){
    var selectedGrouping = $('.session-dropdown option:selected').data('slug');
    window.location = '/users/1/schoolsession/' + selectedGrouping;
  });

  $('.tags-dropdown').change(function(){
    var selectedGrouping = $('.tags-dropdown option:selected').data('slug');
    window.location = '/users/1/entries/' + selectedGrouping;
  });

  $('.blogger-dropdown').change(function(){
    var selectedGrouping = $('.blogger-dropdown option:selected').data('slug');
    console.log(selectedGrouping);
    window.location = '/users/1/bloggers/' + selectedGrouping;
  })

  // list bloggers by school session in table
  $(".school-sessions-dropdown").change(function(){
    var selectedSession = $('.school-sessions-dropdown option:selected').data('session-slug');
    var bloggerCount = $('.school-sessions-dropdown option:selected').data('total-session-bloggers');
    var entriesCount = $('.school-sessions-dropdown option:selected').data('total-session-entries');

    $(".panel-title").text(bloggerCount + " Bloggers - " + entriesCount + " entries");

    $(".student-list tr").each(function(){
      if(selectedSession == "all"){
        $(this).css( 'display', 'table-row' );
      } else if($(this).hasClass(selectedSession)){
        $(this).css( 'display', 'table-row' );
      } else {
        $(this).css('display', 'none');
      };
    });
  });

  // publish entries
  $("body").on("click", ".publish", function(event){
    event.preventDefault();
    var entry_slug_data = {
      slug: $(this).data("entry-slug")
    }
    $.post('/entries/publish', entry_slug_data, function(){});

    $(this).removeClass('publish');
    $(this).removeClass("btn-success");
    $(this).addClass("btn-warning");
    $(this).addClass("published");
    $(this).text("Published!");
  });

  // unpublish
  $("body").on("click", ".published", function(event){
    event.preventDefault();
    var entry_slug_data = {
      slug: $(this).data("entry-slug")
    }

    $.post('/entries/unpublish', entry_slug_data, function(){});

    $(this).removeClass("published");
    $(this).removeClass("btn-warning");
    $(this).addClass("publish");
    $(this).addClass("btn-success");
    $(this).text("Publish");
  })

  // dash button decoration
  $(".dash-btn").mouseover(function(){
    $(this).css('background-color', '#2069e8;');
  });

  $(".view-tags-btn").click(function(){
    var tagList = $(this).attr('id');
    var display = $('.' + tagList).css('display');
    

    if(display == "none"){
      $('.' + tagList).css('display', 'inline-block');
      $(this).text("Hide Tags");
    } else {
      $('.' + tagList).css('display', 'none');
      $(this).text("Show Tags");
    };
  });

  // tag entries
  $("body").on("click", ".tag", function(event){
    event.preventDefault();

    var entry_tag_data = {
      tag_id: $(this).data("entry-tag-id"),
      entry_id: $(this).data("entry-id")
    }

    $.post('/entries/tag', entry_tag_data, function(){});

    $(this).removeClass("btn-success");
    $(this).addClass("label-danger");

  });


  // create and add tag:
  $(".tag-generate").submit(function(event){
    console.log("submit realized");
    var postData = $(this).serializeArray();
    var formURL = $(this).attr("action");
    var id = $(this).parent().attr('class');
    id = "." + id.split(" ")[1];
    var input = '.tag-word-' + id.split('-')[2];

    if ($(input).val() == "") {
    } else {
      $.ajax(
      {
        url : formURL,  
        type: "post",
        data: postData,
        success:function(data, textStatus, jqXHR) 
          {
            var tagHtml = "<span class=\"label label-danger published\">" + data.tag_word + "</span> ";
            $(id + ' div').first().append(tagHtml);
            $(input).val('');
          },
        error: function(jqXHR, textStatus, errorThrown) 
          {
              console.log(errorThrown)    
          }
      });
    }
    event.preventDefault();
  });

  // prevent blank tag creation:


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

  // count tweet characters
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