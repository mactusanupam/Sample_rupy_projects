class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :user_type, foreign_key: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_reference :users, :company, foreign_key: true
    add_column :users, :approved, :boolean
    add_reference :users, :job_title, foreign_key: true
  end
end
