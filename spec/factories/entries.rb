require 'faker'

FactoryGirl.define do
  factory :entry do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    sequence(:url) { |n| "www.#{n}.com" }
    author { Faker::Name.name }
    published Time.now
    association :feed, factory: :feed
    association :school_session, factory: :school_session
  end
end