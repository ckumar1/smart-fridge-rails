require 'faker'

FactoryGirl.define do

  factory :user do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(8) }
  end


  factory :food_item do |i|
    i.name { Faker::Lorem.words 1 }
    i.expiration_date { 2.weeks.from_now }
    i.calories { rand(500) }
    i.description { Faker::Lorem.sentence }
    association :user
  end

  factory :recipe do |i|
    i.name { Faker::Lorem.words 2 }
    i.directions { Faker::Lorem.sentences 5 }
    i.ingredients { Faker::Lorem.words 10 }
    i.notes { Faker::Lorem.paragraph }
    association :user
  end

end
