class TwitterController < ApplicationController

	def tweet
	 	message = params[:tweet]
	 	TwitterClient.update(message)
	 	json_message = {json_message: message }
	 	render :json => json_message
	end

end


# #button on one of the views (click to tweet)
# #button go to a route
# #config/routes (to handle the request)
# #point it towards twitter and the tweet method
# #form has to have a hidden form field 

# modal, partial that you can use (render modal the id you want. hidden in application controller)