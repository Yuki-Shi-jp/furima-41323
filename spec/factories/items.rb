FactoryBot.define do
  factory :item do
    product_name { Faker::Commerce.product_name }
    product_description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: Category.count) }
    sales_status_id { Faker::Number.between(from: 2, to: SalesStatus.count) }
    shipping_fee_status_id { Faker::Number.between(from: 2, to: ShippingFeeStatus.count) }
    prefecture_id { Faker::Number.between(from: 2, to: Prefecture.count) }
    scheduled_delivery_id { Faker::Number.between(from: 2, to: ScheduledDelivery.count) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
