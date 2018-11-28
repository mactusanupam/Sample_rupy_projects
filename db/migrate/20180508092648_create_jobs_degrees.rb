class CreateJobsDegrees < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs_degrees do |t|
      t.references :degree, foreign_key: true
      t.references :job, foreign_key: true
    end
  end
end
