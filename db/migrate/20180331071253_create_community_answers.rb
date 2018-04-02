class CreateCommunityAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :community_answers do |t|
      t.text :answer_text
      t.integer :vote_count
      t.boolean :anonymus
      t.references :community_question, foreign_key: true
      t.references :user, foreign_key: true
      t.bigint :parent_id, foreign_key: true

      t.timestamps
    end
  end
end
