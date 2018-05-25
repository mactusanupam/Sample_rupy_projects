class CreateAnalytics < ActiveRecord::Migration[5.1]
  def change
    create_table :analytics do |t|
      t.string :type
      t.integer :record_id
      t.integer :user_id
      t.boolean :view_count , default:false
      t.boolean :vote_count,  default:false
      t.string :ip_address
      t.string :session_hash

      t.timestamps
    end
  end
end
