# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    gender { User.genders.keys.sample }
    country_code { Faker::PhoneNumber.country_code }
    phone_number { Faker::PhoneNumber.phone_number.to_i }
  end
end
