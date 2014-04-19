require 'faker'

FactoryGirl.define do

  factory :user do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(8) }
  end


  factory :food_item do |i|
    i.name "Apple"
    i.expiration_date { 2.weeks.from_now }
    i.calories 80
    i.description 'fresh and red'
    association :user
  end
end
