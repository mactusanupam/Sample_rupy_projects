class CreateCvAnalytics < ActiveRecord::Migration[5.1]
  def change
    create_table :cv_analytics do |t|
      t.references :digital_cv, foreign_key: true
      t.boolean :viewed
      t.boolean :downloaded
      t.string :location

      t.timestamps
    end
  end
end
