class AddCounterToDigitalCvs < ActiveRecord::Migration[5.1]
  def change
    add_column :digital_cvs, :view, :integer, default: 0
    add_column :digital_cvs, :download, :integer, default: 0
  end
end
