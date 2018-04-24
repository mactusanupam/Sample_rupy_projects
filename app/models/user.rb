class User < ApplicationRecord
  belongs_to :user_type, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  before_create :update_user_type

  has_many :jobs
  has_many :job_applications, dependent: :destroy

  def update_user_type
    self.user_type = UserType.find_by(title: 'Other User')
  end

  #THIS IS TEMPORARY. MUST BE REMOVED WHEN MAILER SETUP IS DONE.
  def update_confirmed_at
    update_attributes(confirmed_at: Time.now)
  end

  def admin?
    user_type.name == 'Admin'
  end

  def super_admin?
    user_type.name == 'Super Admin'
  end

  def corporate_user?
    user_type.name == 'Corporate User'
  end

  def other_user?
    user_type.name == 'Other User'
  end

  def recruiter?
    user_type.name == 'Recruiter'
  end

  def has_applied?(job_id)
    job_applications.where(job_id: job_id).present?
  end 

  def disapprove
    self.approved = false
  end

  def approve
    self.approved = true
  end

  def auto_approval
    if self.user_type_id == 4
      approve
    end
  end

  def send_admin_mail
  end

  def recruiter_or_corporate_user?
    user_type.present? && ( corporate_user? || recruiter? )
  end

  def company_user_validation?
    self.user_type_id.to_i == 4 || self.user_type_id.to_i == 0 || self.company_id.present?
  end

   

end
