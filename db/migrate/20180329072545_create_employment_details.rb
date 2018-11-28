class CreateEmploymentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :employment_details do |t|
      t.references :job_title, foreign_key: true
      t.references :digital_cv, foreign_key: true
      t.references :company, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :present_job
      t.text :responsibilities
      t.text :achievement

      t.timestamps
    end
  end
end
