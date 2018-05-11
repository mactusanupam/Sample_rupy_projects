class CreateJobResponsibilities < ActiveRecord::Migration[5.1]
  def change
    create_table :job_responsibilities do |t|
      t.integer :responsibility_type
      t.text :responsibility_text
      t.timestamps
    end
  end
end
