class BillingPlan < ApplicationRecord
  serialize :features, Hash

  has_many :subsciptions
end
