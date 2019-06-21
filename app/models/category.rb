class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories
  has_many :user_categories
  has_many :users, through: :user_categories

  validates :name, presence:true, uniqueness:true

end
