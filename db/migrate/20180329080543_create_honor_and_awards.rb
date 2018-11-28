class CreateHonorAndAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :honor_and_awards do |t|
      t.string :title
      t.date :award_date
      t.references :company, foreign_key: true
      t.string :awarded_by
      t.references :digital_cv, foreign_key: true

      t.timestamps
    end
  end
end
