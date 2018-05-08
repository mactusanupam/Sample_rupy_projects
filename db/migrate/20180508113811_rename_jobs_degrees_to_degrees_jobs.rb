class RenameJobsDegreesToDegreesJobs < ActiveRecord::Migration[5.1]
  def change
  	rename_table :jobs_degrees, :degrees_jobs
  end
end
