require 'faker'

FactoryGirl.define do

  factory :user do |u|
    u.name { Faker::Name.name }
    u.email { Faker::Internet.email }
    u.password { Faker::Internet.password(8) }
  end

  factory :food_item do |f|
    f.name { Faker::Lorem.words 1 }
    f.expiration_date { 2.weeks.from_now }
    f.calories { rand(500) }
    f.description { Faker::Lorem.sentence }
    user
  end

  factory :recipe do |r|
    r.name { Faker::Lorem.words(2).join(' ') }
    r.directions { Faker::Lorem.sentences(5).join(' ') }
    r.notes { Faker::Lorem.paragraph }
    user
  end

end
