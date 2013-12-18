require 'faker'

FactoryGirl.define do
  factory :blogger do
    name { Faker::Name.name }
    sequence(:feed_url) { |n| "joebro#{n}@nobro.com" }
    semester 3
    sequence(:twitter_handle) { |n| "@joebro#{n}" }

    factory :invalid_blogger do
      name nil
      feed_url nil
    end
  end
end