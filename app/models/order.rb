class Order < ActiveRecord::Base

  validates :user_id, presence: true

  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calc_subtotal(cart)
    self.subtotal = 0
    cart.each do |item|
      self.subtotal += item.product.price * item.quantity
    end
  end

  def calc_tax
    self.tax = subtotal * 0.09
  end

  def calc_total
    self.total = subtotal + tax
  end

  def calc_prices(cart)
    calc_subtotal(cart)
    calc_tax
    calc_total
  end

end
