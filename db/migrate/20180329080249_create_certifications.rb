class CreateCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :certifications do |t|
      t.string :title
      t.string :certifier
      t.date :date
      t.text :details
      t.references :digital_cv, foreign_key: true

      t.timestamps
    end
  end
end
