class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Associations
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  # Validations
  validates :image, presence: true
  validates :product_name, :product_description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :sales_status_id, numericality: { other_than: 1 }, presence: true
  validates :shipping_fee_status_id, numericality: { other_than: 1 }, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }, presence: true
  validates :scheduled_delivery_id, numericality: { other_than: 1 }, presence: true
end
