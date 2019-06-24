class Product < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :blank?

  validates :name, presence:true, uniqueness: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ },
    numericality: { greater_than: 0, less_than: 1000000}
  validates :sale_price, presence: true, allow_blank: true, format: { with: /\A\d+(?:\.\d{2})?\z/ },
    numericality: { greater_than: 0, less_than: 1000000}
end
