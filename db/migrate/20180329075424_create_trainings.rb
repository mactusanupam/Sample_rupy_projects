class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :info
      t.integer :duration
      t.string :institute
      t.references :digital_cv, foreign_key: true

      t.timestamps
    end
  end
end
