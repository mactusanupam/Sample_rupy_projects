class User < ApplicationRecord
  belongs_to :user_type, optional: true
  belongs_to :company, optional:true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  accepts_nested_attributes_for :company, :allow_destroy => true

  before_create :update_user_type
  
  def update_user_type
    self.user_type = UserType.find_by(title: 'Other User')
  end
end
