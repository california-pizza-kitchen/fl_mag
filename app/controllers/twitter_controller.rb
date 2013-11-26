class TwitterController < ApplicationController


def tweet
 	TwitterClient = Twitter::REST::Client.new
 	TwitterClient.update(Blogger.name )

end 
 

end 

author is Blogger.name 
title is Entry.title
url is 
 

#try to jsut tweet the user.name

#author
#title 
#url of article 
#twitter handle of what you are publishing

# q, in your last example with foursquare, what are the values that you kept &
# what are the values that you interpolated?
# -- try each of these with update
# -- see if you can get the tweet 


# to update the tweet
# 	TwitterClient = Twitter::REST::Client.new
# 	ready_tweet = TwitterClient.("Guest post by" "{}" "#{title}" "{#{author_slug}" "{ }") 