require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  describe "POST /create" do
    let!(:broadcast) { Broadcast.create(title: "Broadcast 1", broadcast_date: Time.zone.now) }

    let(:email) { "test@example.com" }
    let(:firstname) { "Darth" }
    let(:surname) { "Vader" }
    let(:registration_ip) { "111.222.333.444" }

    subject do
      post "create", params: { subscription: {
        email: email,
        firstname: firstname,
        surname: surname,
        registration_ip: registration_ip,
        broadcast_id: broadcast.id
      } }
    end

    it "returns http success" do
      subject
      expect(response).to have_http_status(:created)
    end

    it "creates a subscription" do
      expect { subject }.to change(Subscription, :count).from(0).to(1)

      new_subscription = Subscription.find_by(email: email)
      expect(new_subscription.firstname).to eq(firstname)
      expect(new_subscription.surname).to eq(surname)
      expect(new_subscription.registration_ip).to eq(registration_ip)
      expect(new_subscription.broadcast.id).to eq(broadcast.id)
    end
  end
end
