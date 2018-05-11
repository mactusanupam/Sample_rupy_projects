class AddRemoteLocationToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :remote_location, :boolean
  end
end
