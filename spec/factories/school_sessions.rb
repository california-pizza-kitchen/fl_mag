require 'faker'

FactoryGirl.define do
  factory :school_session do
    name {Faker::Company.name + "-" + Faker::Number.number(3)}
    start_date  { Date.today - Faker::Number.number(3).to_i.days }
  end
end