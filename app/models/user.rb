class User < ApplicationRecord
  belongs_to :user_type, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  before_create :update_user_type

  def update_user_type
    self.user_type = UserType.find_by(title: 'Other User')
  end
end
