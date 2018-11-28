class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
