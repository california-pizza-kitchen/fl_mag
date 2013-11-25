class EmailWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { weekly }

  def perform
    Subscriber.all.each do |subscriber|
      ModelMailer.digest_email(subscriber).deliver
    end
  end

end