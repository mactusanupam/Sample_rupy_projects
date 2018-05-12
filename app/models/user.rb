class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  belongs_to :user_type
  belongs_to :company, optional: true

  has_many :jobs
  has_many :job_applications, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :company_id, presence: true, :if => lambda {|u| user_type_id == UserType.find_by(title: 'Employer').id}

  accepts_nested_attributes_for :company, :allow_destroy => true

  def admin?
    self.user_type.title == 'Admin'
  end

  def super_admin?
    self.user_type.title == 'Super Admin'
  end

  def has_applied?(job_id)
    job_applications.where(job_id: job_id).present?
  end

  def employer?
    self.user_type.title == 'Employer'
  end

  def individual?
    self.user_type.title == 'Individual'
  end
end
