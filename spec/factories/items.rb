FactoryBot.define do
  factory :item do
    name                        { Faker::Lorem.sentence }
    description                 { Faker::Lorem.sentence }
    price                       { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id                 { Faker::Number.between(from: 2, to: 11) }
    status_id                   { Faker::Number.between(from: 2, to: 7) }
    delivery_cost_id            { Faker::Number.between(from: 2, to: 3) }
    prefecture_id               { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id             { Faker::Number.between(from: 2, to: 4) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end

    association :user
  end
end
