require "spec_helper"

describe SubscriberMailer do
  describe "new_record_notification" do
    let(:mail) { SubscriberMailer.new_record_notification }

    it "renders the headers" do
      mail.subject.should eq("New record notification")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
