class Order < ActiveRecord::Base

  validates :user_id, presence: true

  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calc_subtotal(product_price)
    self.total = 0
    cart_items.each do |cart_item|
      self.subtotal += cart_item.product.price * cart_item.quantity
    end
  end

  def calc_tax
    self.tax = subtotal * 0.09
  end

  def calc_total
    self.total = subtotal + tax
  end

  def calc_prices(product_price)
    calc_subtotal(product_price)
    calc_tax
    calc_total
  end
end
