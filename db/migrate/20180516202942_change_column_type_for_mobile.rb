class ChangeColumnTypeForMobile < ActiveRecord::Migration[5.1]
  def change
    change_column :contact_details, :mobile, :string
    change_column :references, :mobile, :string
  end
end
