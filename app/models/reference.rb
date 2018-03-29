class Reference < ApplicationRecord
  belongs_to :job_title
  belongs_to :company
  belongs_to :digital_cv
end
