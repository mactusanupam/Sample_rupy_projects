class CreateCommunityQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :community_questions do |t|
      t.string :question_text
      t.text :brief_details
      t.integer :vote_count
      t.integer :view_count
      t.references :user, foreign_key: true
      t.boolean :anonymus

      t.timestamps
    end
  end
end
