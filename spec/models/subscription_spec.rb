require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "create" do
    let(:associated_broadcast) { FactoryBot.create(:broadcast) }

    it "generates a random token after the subscription is created" do
      subscription = Subscription.new(email: "test@test.com", firstname: "Anakin", surname: "Skywalker", broadcast: associated_broadcast)
      expect(subscription.personal_token).to be_nil
      subscription.save!
      expect(subscription.personal_token).to_not be_nil
    end
  end
end
