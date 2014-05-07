# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    name "Diced Tomatos"
    quantity "2 Cups"
    association :recipe
  end
end
