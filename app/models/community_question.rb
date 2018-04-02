class CommunityQuestion < ApplicationRecord
  belongs_to :user

  has_many :community_answers, -> { where(:parent_id => nil).order("id DESC") }, dependent: :destroy

  validates :question_text, presence: true, length: { minimum: 30 }
  validates :terms_and_conditions, :acceptance => true, if: Proc.new{|a| a.question_text.to_s.length > 30 }

  def to_param
    [id, question_text.parameterize].join("-")
  end

  def self.search(search_text)
    if search_text
      where('question_text LIKE ?', "%#{search_text}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
