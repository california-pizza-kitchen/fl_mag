class SubscribersController < ApplicationController

  def create
    @subscriber = Subscriber.new
    @subscriber.first_name = params[:name].split(" ").first
    @subscriber.last_name  = params[:name].split(" ").last
    @subscriber.email      = params[:email]
    @subscriber.update(:prospect? => true) if params[:prospect?]
    if @subscriber.save
      SubscriberMailer.new_record_notification(@subscriber).deliver
      flash[:"alert-success"] = 'Thank you for subscribing'
      redirect_to '/feeds'
    end
  end

  def unsubscribe
    if subscriber = Subscriber.read_access_token(params[:signature])
      subscriber.update_attribute :email_opt_in, false
      render :text => "You have been unsubscribed"
    else
      render :text => "Invalid Unsubscribe link" 
    end
  end

  private

  def subscriber_params
   params.require(:subscriber).permit(:name, :email)
  end

end
