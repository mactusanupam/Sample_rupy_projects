class Message < ApplicationRecord
  attr_accessor :terms_and_condition

  validates :name, :email, :body, presence: true
  validates :mobile, presence: true, :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
  validates :terms_and_conditions, :acceptance => true
end
