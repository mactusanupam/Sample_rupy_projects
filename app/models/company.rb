class Company < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, :website, presence: true
  validates :name, uniqueness: true, allow_blank: true
  validates :website,
    :format => {
      :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i,
      :message => "Valid URL required"
    }, allow_blank: true
end
