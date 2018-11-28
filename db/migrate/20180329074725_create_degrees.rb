class CreateDegrees < ActiveRecord::Migration[5.1]
  def change
    create_table :degrees do |t|
      t.string :title

      t.timestamps
    end
  end
end
