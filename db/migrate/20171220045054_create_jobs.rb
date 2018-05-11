class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :industry, foreign_key: true
      t.references :company, foreign_key: true
      t.string :qualification
      t.string :location
      t.integer :offered_ctc

      t.string :website_url
      t.string :experience
      t.text :description


      t.timestamps
    end
  end
end
