class AddIdToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :id, :integer
  end
end