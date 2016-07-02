class AddNumberToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :number, :integer
  end
end
