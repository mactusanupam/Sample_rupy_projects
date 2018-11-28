class ChangePincodeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :contact_details, :pincode, :string
  end
end
