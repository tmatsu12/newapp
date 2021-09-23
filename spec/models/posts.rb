FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 20) }
    body1 { Faker::Lorem.characters(number: 20) }
    body2 { Faker::Lorem.characters(number: 20) }
    body3 { Faker:Lorem.characters(number: 20) }
    association :user
  end
end