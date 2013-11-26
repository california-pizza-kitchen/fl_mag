class EmailWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform
    sub_list = Subscriber.all
    sub_list.each do |subscriber|
      if subscriber.email.nil? && subscriber.opt_in? == true 
      next
      else
        SubscriberMailer.digest_email(subscriber).deliver
      end
    end
  end

end