class Subscription < ApplicationRecord
  belongs_to :broadcast

  validates :email, presence: true

  has_secure_token :personal_token, on: :create
end
