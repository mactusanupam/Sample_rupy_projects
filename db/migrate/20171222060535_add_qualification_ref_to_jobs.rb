class AddQualificationRefToJobs < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobs, :qualification
    add_reference :jobs, :qualification, foreign_key: true
  end
end
