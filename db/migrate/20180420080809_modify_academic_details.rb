class ModifyAcademicDetails < ActiveRecord::Migration[5.1]
  def change
    change_column :academic_details, :percentage, :decimal, :precision => 4, :scale => 2
    add_column :academic_details, :is_cgpa, :boolean
  end
end
