class AddJobTitleToJobResponsibilities < ActiveRecord::Migration[5.1]
  def change
    add_reference :job_responsibilities, :job_title, foreign_key: true
  end
end
