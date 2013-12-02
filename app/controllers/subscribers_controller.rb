class SubscribersController < ApplicationController

  def create
    @subscriber = Subscriber.new
    @subscriber.first_name = params[:name].split(" ").first
    @subscriber.last_name  = params[:name].split(" ").last
    @subscriber.email      = params[:email]
    @subscriber.hex_key    = SecureRandom.hex(16)

    @subscriber.update(:prospect? => true) if params[:prospect?]

    if @subscriber.save
      SubscriberMailer.new_record_notification(@subscriber).deliver
      flash[:"alert-success"] = 'Thank you for subscribing'
      redirect_to '/feeds'
    else
      flash[:"alert-danger"] = 'Invalid Email'
      redirect_to '/feeds'
    end
  end

  def unsubscribe
    @subscriber = Subscriber.find_by(:hex_key => params[:signature])
    if @subscriber.opt_in? == true
      @subscriber.update(:opt_in? => false)
      SubscriberMailer.unsubscribe_confirmation(@subscriber).deliver
      flash[:"alert-info"] = 'You have been unsubscribed'
      redirect_to '/feeds'
    else
      flash[:"alert-warning"] = 'You are not subscribed'
      redirect_to '/feeds'
      end
  end

  private

  def subscriber_params
   params.require(:subscriber).permit(:name, :email)
  end

end
