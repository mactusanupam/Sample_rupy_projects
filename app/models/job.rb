class Job < ApplicationRecord
  attr_accessor :min_exp, :max_exp

  belongs_to :industry
  belongs_to :company
  belongs_to :qualification
  belongs_to :specialization
  belongs_to :user

  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :skills
  has_and_belongs_to_many :degrees
  accepts_nested_attributes_for :degrees

  has_many :job_applications, :dependent => :destroy
  accepts_nested_attributes_for :job_applications, allow_destroy: true

  has_many :suspicious_jobs, :dependent => :destroy
  accepts_nested_attributes_for :suspicious_jobs, allow_destroy: true

  validates :title, presence: true, length: { minimum: 5, allow_blank: true }
  validates :company_id, presence: true
  validates :qualification_id, presence: true
  validates :offered_ctc, presence: true
  validates :location, presence: true
  validates :degree_ids, presence: true
  validates :specialization_id, presence: true
  validates :industry_id, presence: true
  validates :skill_ids, presence: true
  validates :description, presence: true, length: { minimum: 100, allow_blank: true  }
  validates :min_exp, :max_exp, presence: true
  validates :max_exp,
            numericality: { greater_than_or_equal_to: :min_exp, message: 'must be greater than min exp.' },
            allow_blank: true

  before_validation :change_exp_to_integer
  before_save :update_experience

  scope :active, lambda { where("job_status NOT IN (?)", ["Position Closed", "Position Filled", "On hold", "Draft"]) }

  def to_param
    [id, title.parameterize, company.name.parameterize].join("-")
  end

  def change_exp_to_integer
    self.min_exp = self.min_exp.to_i if self.min_exp.present?
    self.max_exp = self.max_exp.to_i if self.max_exp.present?
  end

  def update_experience
    self.experience = self.min_exp.to_s + ' - '+ self.max_exp.to_s
  end

  def self.filter(title,search, company_type_id, industry_id)
    job = Job.order(:title)
    job = Job.order(:location)
    job = job.where(company_id: company_id) if company_id.present?
    job = job.where(industry_id: industry_id) if industry_id.present?
  end
end
