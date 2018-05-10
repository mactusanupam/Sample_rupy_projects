class CreateJobsSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs_skills do |t|
      t.references :job, foreign_key: true
      t.references :skill, foreign_key: true
    end
  end
end
