class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  belongs_to :order

  def calc_subtotal(product_price)
    self.subtotal = product_price * quantity
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
