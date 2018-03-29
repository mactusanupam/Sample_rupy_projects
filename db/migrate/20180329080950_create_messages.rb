class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.integer :mobile, limit: 8
      t.text :body
      t.string :type
      t.string :subject

      t.timestamps
    end
  end
end
