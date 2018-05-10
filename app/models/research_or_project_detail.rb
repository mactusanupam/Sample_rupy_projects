class ResearchOrProjectDetail < ApplicationRecord
  belongs_to :digital_cv

  def duration
    [start_date, end_date].compact.map{|a| a.strftime("%B, %Y") }.join(' - ')
  end
end
