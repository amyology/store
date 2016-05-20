class RemoveIdFromSupplier < ActiveRecord::Migration
  def change
    remove_column :suppliers, :supplier_id, :string
  end
end
