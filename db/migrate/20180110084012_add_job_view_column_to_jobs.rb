class AddJobViewColumnToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :job_view, :integer,default: 0
  end
end
