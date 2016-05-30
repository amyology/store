class Category < ActiveRecord::Base

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :categorized_products
  has_many :products, through: :categorized_products
end
