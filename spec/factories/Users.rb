require 'faker'

FactoryGirl.define do

  factory :user do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password }
  end
  factory :food_item do |f|
    f.name "Apple"
    f.expiration_date "April 17th, 2014"
    f.user_id "123"
  end
end