require 'faker'

FactoryGirl.define do
  factory :tag do
    word { Faker::Company.name.downcase }
  end
end