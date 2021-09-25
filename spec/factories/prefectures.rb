FactoryBot.define do
  factory :prefecture do
    id { Faker::Number.within(range: 35..38) }
    name { "香川県" }
    region { "shikoku" }
  end
end