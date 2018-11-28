class AddSeniorityLevelToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :seniority_level, :string
  end
end
