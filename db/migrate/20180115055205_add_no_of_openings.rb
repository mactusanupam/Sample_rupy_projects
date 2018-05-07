class AddNoOfOpenings < ActiveRecord::Migration[5.1]
  def change
  	add_column :jobs, :no_of_openings, :integer, default: 0
  end
end
