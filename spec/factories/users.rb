require 'faker'

FactoryGirl.define do
  factory :user do
    password "joe"
    password_confirmation "joe"
  end
end