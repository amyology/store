class User < ActiveRecord::Base
  has_many :orders
  has_many :carted_products
  has_many :products, through: :carted_products

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def carted_items
    carted_products.where(status: 'carted')
  end

end
