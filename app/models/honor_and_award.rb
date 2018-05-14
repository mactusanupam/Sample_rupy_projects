class HonorAndAward < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :digital_cv
end
