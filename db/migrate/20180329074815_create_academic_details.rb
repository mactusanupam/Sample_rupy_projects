class CreateAcademicDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :academic_details do |t|
      t.string :institute
      t.string :university
      t.boolean :pursuing
      t.date :start_date
      t.date :end_date
      t.decimal :percentage
      t.references :degree, foreign_key: true
      t.references :specialization, foreign_key: true
      t.references :digital_cv, foreign_key: true

      t.timestamps
    end
  end
end
