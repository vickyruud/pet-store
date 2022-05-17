class AddDeletedCommentsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :delete_comment, :string
  end
end
