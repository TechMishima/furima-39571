FactoryBot.define do
  factory :order_address do
    post_code             { Faker::Address.postcode }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    shipping_municipality { Faker::Lorem.sentence }
    shipping_address      { Faker::Lorem.sentence }
    shipping_building     { Faker::Lorem.sentence }
    buyer_phone_number    { Faker::Number.between(from: 10**9, to: 10**11 - 1) }

    token                 { Faker::Lorem.sentence }
  end
end
