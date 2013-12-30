require 'faker'

FactoryGirl.define do
  factory :entry do
    title { Faker::Lorem.sentence }
    sequence(:url) { |n| "www.#{n}.com" }
    author { Faker::Name.name }
    published Time.now
    association :feed, factory: :feed
  end
end