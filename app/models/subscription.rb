class Subscription < ApplicationRecord
  belongs_to :billing_type
  belongs_to :subscriptionable, polymorphic: true
end
