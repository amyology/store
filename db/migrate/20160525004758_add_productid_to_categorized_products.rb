class AddProductidToCategorizedProducts < ActiveRecord::Migration
  def change
    add_column :categorized_products, :productid, :integer
    add_column :categorized_products, :categoryid, :integer
  end
end
