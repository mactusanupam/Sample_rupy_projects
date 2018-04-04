class ContactDetail < ApplicationRecord
  belongs_to :digital_cv

  validates :first_name, :last_name, :email, :mobile, :pincode, :address, presence:true
  validates :mobile, :numericality => true,
            :length => { :minimum => 10, :maximum => 10 }, allow_nil: true
  validates :pincode, numericality: true,
            :length => { :minimum => 5, :maximum => 6 }, allow_nil: true

  def name
    first_name.to_s + " " + last_name.to_s
  end
end
