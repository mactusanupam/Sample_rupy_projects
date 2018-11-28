class DigitalCv < ApplicationRecord
  serialize :additional_sections, JSON

  belongs_to :user, optional: true
  belongs_to :template

  has_one :contact_detail, :dependent => :destroy
  accepts_nested_attributes_for :contact_detail

  has_one :personal_detail, :dependent => :destroy
  accepts_nested_attributes_for :personal_detail

  has_many :employment_details, :dependent => :destroy
  accepts_nested_attributes_for :employment_details, allow_destroy: true

  has_many :academic_details, :dependent => :destroy
  accepts_nested_attributes_for :academic_details, allow_destroy: true

  has_many :cv_languages, :dependent => :destroy
  has_many :languages, through: :cv_languages
  accepts_nested_attributes_for :cv_languages, allow_destroy: true, :reject_if => proc { |attributes| attributes['language_id'].blank? }

  has_many :research_or_project_details, :dependent => :destroy
  accepts_nested_attributes_for :research_or_project_details, allow_destroy: true, :reject_if => :all_blank

  has_many :trainings , :dependent => :destroy
  accepts_nested_attributes_for :trainings, allow_destroy: true, :reject_if => :all_blank

  has_many :honor_and_awards,  :dependent => :destroy
  accepts_nested_attributes_for :honor_and_awards, allow_destroy: true, :reject_if => :all_blank

  has_many :references, :dependent => :destroy
  accepts_nested_attributes_for :references, allow_destroy: true, :reject_if => :all_blank

  has_many :cv_skills, :dependent => :destroy
  has_many :skills, through: :cv_skills
  accepts_nested_attributes_for :cv_skills, allow_destroy: true, :reject_if => :all_blank

  has_one :photo, :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :photo, :reject_if => :all_blank

  has_one :present_job, -> { where(:present_job => true) }, :class_name => "EmploymentDetail", foreign_key: :digital_cv_id

  has_many :certifications, :dependent => :destroy
  accepts_nested_attributes_for :certifications, allow_destroy: true, :reject_if => :all_blank

  validates :summary,  presence: true, length: { maximum: 500 }, allow_nil: true
  validates :slug, presence: true, allow_nil: true
  validates :slug, uniqueness: true, allow_blank: true
end
