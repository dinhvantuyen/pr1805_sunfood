class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :product_orders
  has_many :products, through: :product_orders

  def subtotal
    product_orders.collect{ |po| po.valid? ? (po.quantity*po.product.price) : 0}.sum
  end

  def total_quantity
    product_orders.collect{ |po| po.presence ? po.quantity : 0}.sum
  end
end
