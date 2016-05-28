class Product < ActiveRecord::Base

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :products

TAX_RATE = 0.09

def sale_message
  if price < 11
    "Discount item"
  else
    "On sale"
  end
end

def tax
  price * TAX_RATE
end

def total
  price + (price * TAX_RATE)
end

def img_preview
  images.first.src
end

end