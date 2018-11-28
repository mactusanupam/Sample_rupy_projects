class CreatePersonalDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_details do |t|
      t.string :gender
      t.date :date_of_birth
      t.string :marital_status
      t.string :nationality
      t.boolean :disabled
      t.text :hobbies
      t.text :affiliations
      t.references :digital_cv, foreign_key: true

      t.timestamps
    end
  end
end
