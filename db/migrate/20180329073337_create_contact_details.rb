class CreateContactDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_details do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :mobile, limit: 8
      t.string :linkedin_url
      t.string :skype_username
      t.text :address
      t.integer :pincode
      t.references :digital_cv, foreign_key: true

      t.timestamps
    end
  end
end
