class ModifyColumnsFromForeignKeyToText < ActiveRecord::Migration[5.1]
  def change
    remove_reference :references, :company, index: true, foreign_key: true
    remove_reference :honor_and_awards, :company, index: true, foreign_key: true

    add_column :references, :company_name, :string
    add_column :honor_and_awards, :company_name, :string
  end
end
