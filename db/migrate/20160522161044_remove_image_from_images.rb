class RemoveImageFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :image1, :string
    remove_column :images, :image2, :string
    remove_column :images, :image3, :string
    remove_column :images, :image4, :string
  end
end
