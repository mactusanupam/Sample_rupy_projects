class CreateCvSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :cv_skills do |t|
      t.references :digital_cv, foreign_key: true
      t.references :skill, foreign_key: true
      t.string :type
      t.integer :self_rating

      t.timestamps
    end
  end
end
