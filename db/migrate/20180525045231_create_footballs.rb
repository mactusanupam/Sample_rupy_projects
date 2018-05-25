class CreateFootballs < ActiveRecord::Migration[5.1]
  def change
    create_table :footballs do |t|
      t.string :team
      t.string :palyer

      t.timestamps
    end
  end
end
