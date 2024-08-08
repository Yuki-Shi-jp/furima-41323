class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  validates :token, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }

  def save
    order = Order.create(user_id:, item_id:)

    Address.create(
      postal_code:,
      prefecture_id:,
      city:,
      address:,
      building_name:,
      phone_number:,
      order_id: order.id
    )
  end
end
