class RenameColumnNameToTitle < ActiveRecord::Migration[5.1]
  def change
    rename_column :job_titles, :name, :title
  end
end
