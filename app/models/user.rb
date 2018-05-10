class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  belongs_to :user_type
  belongs_to :company, optional: true

  validates :first_name, :last_name, presence: true

  accepts_nested_attributes_for :company, :allow_destroy => true

  def admin?
    self.user_type.title = 'Admin'
  end

  def super_admin?
    self.user_type.title = 'Super Admin'
  end

  def employer?
    self.user_type.title = 'Employer'
  end

  def individual?
    self.user_type.title = 'Individual'
  end
end
