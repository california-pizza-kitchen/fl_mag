class SubscribersController < ApplicationController

  def create
    @subscriber = Subscriber.new
    if @subscriber.save
      ModelMailer.new_record_notification(@subscriber).deliver
    end
  end

end