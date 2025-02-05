require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  describe "POST /create" do
    let!(:broadcast) { FactoryBot.create(:broadcast) }

    let(:email) { "test@example.com" }
    let(:firstname) { "Darth" }
    let(:surname) { "Vader" }
    let(:registration_ip) { "111.222.333.444" }
    let(:broadcast_id) { broadcast.id }

    subject do
      post "create", params: { subscription: {
        email: email,
        firstname: firstname,
        surname: surname,
        registration_ip: registration_ip,
        broadcast_id: broadcast_id
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

    context "when the broadcast id does not exist" do
      let(:broadcast_id) { 99999999 }

      it "returns http error" do
        subject
        expect(response).to have_http_status(:bad_request)
      end

      it "does not create a subscription" do
        expect { subject }.to_not change(Subscription, :count)
      end
    end

    context "when the email already exists" do
      let!(:existing_subscription) { FactoryBot.create(:subscription) }
      let(:email) { existing_subscription.email }

      it "returns http error" do
        subject
        expect(response).to have_http_status(:bad_request)
      end

      it "does not create a subscription" do
        expect { subject }.to_not change(Subscription, :count)
      end
    end
  end
end
