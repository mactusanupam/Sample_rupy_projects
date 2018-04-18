class RemoveFieldsFromDigitalCv < ActiveRecord::Migration[5.1]
  def change
    remove_column :digital_cvs, :total_experience
    remove_column :digital_cvs, :current_location
    remove_column :digital_cvs, :prefferred_location
  end
end
