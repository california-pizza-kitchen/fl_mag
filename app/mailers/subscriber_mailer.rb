class SubscriberMailer < ActionMailer::Base
  default from: "flatiron_magazine@Sandbox214.Mailgun.Org"

  def new_record_notification(subscriber)
    @subscriber = subscriber
    mail to: subscriber.email, :subject => "Flatiron Magazine: Thank you for subscribing"
  end

  def digest_email(subscriber)
    @subscriber = subscriber
    @new_entries = Entry.find(:all, :order => "mag_published desc", :limit => 5)
    mail to: subscriber.email, :subject => "Flatiron Magazine: Weekly Update"
  end

  def unsubscribe_confirmation(subscriber)
    @subscriber = subscriber
    mail to: subscriber.email, :subject => "Flatiron Magazine: Sorry to see you go"
  end

end
