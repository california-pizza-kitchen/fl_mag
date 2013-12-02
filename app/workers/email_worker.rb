class EmailWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { weekly }

  def perform
    sub_list = Subscriber.where(:opt_in? => true)
    sub_list.each do |subscriber|
      if subscriber.email.nil? 
      next
      else
        SubscriberMailer.digest_email(subscriber).deliver
      end
    end
  end

end
