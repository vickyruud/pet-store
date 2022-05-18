class ChangeImagetoImageUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :image, :image_url
  end
end
