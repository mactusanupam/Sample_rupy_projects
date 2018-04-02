class CommunityAnswer < ApplicationRecord
  belongs_to :community_question, optional: true
  belongs_to :user
  belongs_to :parent, optional: true

  has_many :comments, :class_name => "CommunityAnswer", foreign_key: :parent_id

  validates :answer_text, presence: true
end
