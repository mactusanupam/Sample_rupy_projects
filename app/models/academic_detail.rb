class AcademicDetail < ApplicationRecord
  belongs_to :digital_cv
  belongs_to :degree
  belongs_to :specialization

  validates :university, :percentage, :start_date, :institute, presence:true
  validates :end_date, :presence => true, unless: Proc.new{|a| a.pursuing }
  validate :end_after_start
  validates :percentage, numericality: { greater_than: 0, less_than: 100 }, allow_nil: true, unless: Proc.new{|a| a.is_cgpa }
  validates :percentage, numericality: { less_than: 10 }, if: Proc.new{|a| a.is_cgpa }

  private

  def end_after_start
    if (start_date && end_date) && (end_date < start_date)
      errors.add(:end_date, "must be after the start date")
    end
  end
end
