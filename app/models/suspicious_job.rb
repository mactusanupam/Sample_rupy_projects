class SuspiciousJob< ApplicationRecord
	belongs_to :job

  validates :reporter_email, :comment, presence: true
end
