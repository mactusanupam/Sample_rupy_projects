class ContactDetail < ApplicationRecord
  belongs_to :digital_cv

  validates :first_name, :last_name, :email, :mobile, :pincode,  presence:true
  validates :mobile, :numericality => true,
            :length => { :minimum => 10, :maximum => 10 }, allow_nil: true
  validates :pincode, numericality: true,
            :length => { :minimum => 5, :maximum => 6 }, allow_nil: true
end
