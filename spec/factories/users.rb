require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "joe"
    password_confirmation "joe"
  end
end