class RemoveProductIdfromCategorizedProducts < ActiveRecord::Migration
  def change
    remove_column :categorized_products, :product_id, :string
    remove_column :categorized_products, :category_id, :string
  end
end
