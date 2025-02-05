class Subscription < ApplicationRecord
  belongs_to :broadcast

  validates :email, presence: true
end
