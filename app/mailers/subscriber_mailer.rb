class SubscriberMailer < ActionMailer::Base
  default from: "flatiron_magazine@Sandbox214.Mailgun.Org"

  def new_record_notification(subscriber)
    @subscriber = subscriber
    mail to: subscriber.email, :subject => "Flatiron Magazine: Thank you for subscribing"
  end

  def digest_email(subscriber)
    @new_entries = Entry.find(:all, :order => "mag_published desc", :limit => 5)
    @subscriber = subscriber
    mail to: subscriber.email, :subject => "Flatiron Magazine: Weekly Update"
  end

end
