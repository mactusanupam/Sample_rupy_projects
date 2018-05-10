class AddStatus < ActiveRecord::Migration[5.1]
  def change
  	add_column :job_applications, :status, :string
  	add_column :job_applications, :recruiter_comment, :string
  end
end
