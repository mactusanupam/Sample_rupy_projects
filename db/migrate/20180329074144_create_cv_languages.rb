class CreateCvLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :cv_languages do |t|
      t.references :digital_cv, foreign_key: true
      t.references :language, foreign_key: true
      t.boolean :read
      t.boolean :write
      t.boolean :speak

      t.timestamps
    end
  end
end
