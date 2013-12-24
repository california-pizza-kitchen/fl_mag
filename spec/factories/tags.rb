require 'faker'

FactoryGirl.define do
  factory :tag do
    word { Faker::Name.name.downcase }
  end
end