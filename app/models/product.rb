class Product < ApplicationRecord
  has_many :product_orders
  has_many :reviews
  has_many :comments
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :blank?
end
