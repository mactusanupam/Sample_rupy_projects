class CreateDigitalCvs < ActiveRecord::Migration[5.1]
  def change
    create_table :digital_cvs do |t|
      t.string :name, default: 'My Resume'
      t.text :summary
      t.text :objective
      t.boolean :is_experienced
      t.integer :total_experience
      t.string :employment_status
      t.string :current_location
      t.string :prefferred_location
      t.references :user, foreign_key: true
      t.references :template, foreign_key: true
      t.string :slug

      t.timestamps
    end
    add_index :digital_cvs, :slug
  end
end
