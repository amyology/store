class RemoveProductidFromCategorizedProducts < ActiveRecord::Migration
  def change
    remove_column :categorized_products, :productid, :integer
    remove_column :categorized_products, :categoryid, :integer
    add_column :categorized_products, :product_id, :integer
    add_column :categorized_products, :category_id, :integer
  end
end
