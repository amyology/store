class Image < ActiveRecord::Base

  validates :src, presence: true
  validates :product_id, presence: true

  belongs_to :product
end
