FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: Prefecture.count) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number { '09012345678' }
  end
end
