class CreateResearchOrProjectDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :research_or_project_details do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :url
      t.string :guide
      t.references :digital_cv, foreign_key: true

      t.timestamps
    end
  end
end
