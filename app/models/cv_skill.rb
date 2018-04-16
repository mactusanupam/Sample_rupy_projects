class CvSkill < ApplicationRecord
  belongs_to :digital_cv
  belongs_to :skill

  validates :self_rating, presence: true
end
