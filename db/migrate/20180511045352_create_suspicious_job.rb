class CreateSuspiciousJob < ActiveRecord::Migration[5.1]
  def change
    create_table :suspicious_jobs do |t|
      t.references :job, foreign_key: true
      t.string :reporter_email
      t.text :comment
      t.text :additional_comment
    end
  end
end
