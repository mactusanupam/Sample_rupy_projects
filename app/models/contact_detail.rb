class ContactDetail < ApplicationRecord
  belongs_to :digital_cv

  validates :first_name, :last_name, :email, :mobile, :pincode, :address, presence:true
 # validates :mobile, :numericality => true,
            #:length => { :minimum => 12, :maximum => 12 }, allow_nil: true
  validates :pincode, :length => { :minimum => 5, :maximum => 12 }, allow_nil: true
  
  def name
    first_name.to_s + " " + last_name.to_s
  end

  def address_with_pincode
    a = address if address.present?
    a = a + ", " + pincode.to_s if pincode.present?

    a
  end

  
end
