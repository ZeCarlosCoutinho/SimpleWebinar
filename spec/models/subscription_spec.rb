require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "create" do
    it "generates a random token after the subscription is created" do
      subscription = FactoryBot.build(:subscription)
      expect(subscription.personal_token).to be_nil
      subscription.save!
      expect(subscription.personal_token).to_not be_nil
    end
  end
end
