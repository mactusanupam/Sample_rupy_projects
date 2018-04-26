class BillingPlan < ApplicationRecord
  serialize :features

  has_many :subsciptions
end
