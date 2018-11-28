class AddImageColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_attachment :photos, :image
    add_column :photos, :image_type, :string
  end
end
