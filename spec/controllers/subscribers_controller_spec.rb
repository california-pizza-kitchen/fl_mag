require 'spec_helper'

describe SubscribersController do
  describe "POST #create" do
    describe "with valid attributes" do
      it "saves the subscriber to the database" do
        subscbr = build(:subscriber)
        expect{
          post :create, name: "#{subscbr.first_name} #{subscbr.last_name}", email: subscbr.email
        }.to change(Subscriber, :count).by(1)
      end

      it "redirects to /feeds" do
        subscbr = build(:subscriber)
        post :create, name: "#{subscbr.first_name} #{subscbr.last_name}", email: subscbr.email
        expect(response).to redirect_to '/feeds'
      end
    end

    describe "with invalid attributes" do
      it "does not save the subscriber to the database" do
        subscbr = build(:invalid_subscriber)
        expect{
          post :create, name: "#{subscbr.first_name} #{subscbr.last_name}"
        }.to_not change(Subscriber, :count)
      end

      it "redirects to /feeds" do
        subscbr = build(:subscriber)
        post :create, name: "#{subscbr.first_name} #{subscbr.last_name}", email: subscbr.email
        expect(response).to redirect_to '/feeds'
      end
    end
  end

  describe "POST #unsubscribe" do
    it "assigns the requested subscriber to @subscriber" do
      subscriber = create(:opt_in)
      post :unsubscribe, signature: subscriber.hex_key
      expect(assigns(:subscriber)).to eq subscriber
    end

    it "unsubscribes if subscribed" do
      subscriber = create(:opt_in)
      # post :unsubscribe, signature: subscriber.hex_key
      # expect(subscriber.opt_in?).to eq(false) 
      pending "how to test this method?"
    end

    it "does nothing if not subscribed" do
      subscriber = create(:opt_out)
      pending "how to test this method?"
    end
  end
end