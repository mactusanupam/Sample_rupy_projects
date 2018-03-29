class EmploymentDetail < ApplicationRecord
  belongs_to :job_title
  belongs_to :company
end
