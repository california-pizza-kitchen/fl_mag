require 'spec_helper'

describe Subscriber do
  it "must have an email to be valid" do
    subscriber = Subscriber.new
    expect(subscriber).to have(1).errors_on(:email)
    subscriber.email = "yo@yo.com"
    expect(subscriber).to be_valid
  end
end