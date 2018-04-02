class EmploymentDetail < ApplicationRecord
  belongs_to :job_title
  belongs_to :company
  belongs_to :digital_cv

  validates :start_date, :presence => true
  validates :end_date, :presence => true, unless: Proc.new{|a| a.present_job }
  validate :end_after_start, unless: Proc.new{|a| a.present_job }
  validates :responsibilities, presence: true

  private

  def end_after_start
    if (start_date && end_date) && (end_date < start_date)
      errors.add(:end_date, "must be after the start date")
    end
  end
end
