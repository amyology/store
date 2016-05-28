class CreateCategorizedProducts < ActiveRecord::Migration
  def change
    create_table :categorized_products do |t|
      t.string :product_id
      t.string :category_id

      t.timestamps null: false
    end
  end
end
