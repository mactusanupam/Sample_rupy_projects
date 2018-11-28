class Reference < ApplicationRecord
  belongs_to :job_title, optional: true
  belongs_to :company, optional: true
  belongs_to :digital_cv
end
