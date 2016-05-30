class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { maximum: 200 }
  validates :price, presence: true
  validates :price, numericality: true

  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products

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