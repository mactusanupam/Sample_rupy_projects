class CreateAnalytic < ActiveRecord::Migration[5.1]
  def change
    create_table :analytics do |t|
      t.string :type
      t.integer :type_id, :default =>false
      t.references :user, foreign_key: true
      t.boolean :viewed , :default => false
      t.boolean :downloaded, :default =>false
      t.boolean :vote_count, :default =>false
      t.string :ip_address
      t.string :session_hash
    end
  end
end
