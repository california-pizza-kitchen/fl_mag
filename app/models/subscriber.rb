class Subscriber < ActiveRecord::Base

  def access_token
    Subscriber.create_access_token(self)
  end

  def self.verifier
    ActiveSupport::MessageVerifier.new(BlogAggregator::Application.config.secret_token)
  end

  def self.read_access_token(signature)
    id = verifier.verify(signature)
    Subscriber.find_by_id(id)
    rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  def self.create_access_token(user)
    verifier.generate(user.id)
  end

end