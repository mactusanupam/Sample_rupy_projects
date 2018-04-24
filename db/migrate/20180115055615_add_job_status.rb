class AddJobStatus < ActiveRecord::Migration[5.1]
  def change
  	add_column :jobs, :job_status, :string, default: 'Open'
    add_column :jobs, :job_type, :string, default: 'Permanent'
  end
end
