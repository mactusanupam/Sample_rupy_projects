class AddDegreeToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :degree, foreign_key: true
    add_reference :jobs, :specialization, foreign_key: true
  end
end
