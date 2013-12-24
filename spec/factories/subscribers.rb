require 'faker'

FactoryGirl.define do
  factory :subscriber do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    hex_key SecureRandom.hex(16)

    factory :invalid_subscriber do
      email nil
    end

    factory :prospective_subscriber do
      prospect? true
    end

    factory :opt_in do
      opt_in? true
    end

    factory :opt_out do
      opt_in? false
    end
  end
end