class CreateReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :references do |t|
      t.string :name
      t.references :job_title, foreign_key: true
      t.references :company, foreign_key: true
      t.string :email
      t.integer :mobile, limit: 8
      t.references :digital_cv, foreign_key: true

      t.timestamps
    end
  end
end
