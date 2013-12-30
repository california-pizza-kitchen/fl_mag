require 'faker'

FactoryGirl.define do
  factory :feed do
    association :blogger, factory: :blogger
  end
end