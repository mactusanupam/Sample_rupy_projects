class CreateCrickets < ActiveRecord::Migration[5.1]
  def change
    create_table :crickets do |t|
      t.string :team
      t.string :palyer

      t.timestamps
    end
  end
end
