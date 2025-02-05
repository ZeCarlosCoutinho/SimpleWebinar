require 'rails_helper'

RSpec.describe BroadcastsController, type: :controller do
  let(:broadcast_date1) { Time.zone.now.round(3) } # Round the time to 3 digit milliseconds, which is the default serialization of a datetime
  let(:broadcast_date2) { (broadcast_date1 - 1.day).round(3) }
  let!(:broadcast1) { Broadcast.create(title: "Broadcast 1", broadcast_date: broadcast_date1) }
  let!(:broadcast2) { Broadcast.create(title: "Broadcast 2", broadcast_date: broadcast_date2) }

  describe "GET /index" do
    subject { get :index }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end

    it "returns the list of broadcasts" do
      subject
      broadcasts = JSON.parse(response.body)

      first_broadcast = broadcasts.first
      expect(first_broadcast['title']).to eq(broadcast1.title)
      expect(Time.parse(first_broadcast['broadcast_date'])).to eq(broadcast1.broadcast_date)
      expect(first_broadcast['subscriptions_count']).to eq(broadcast1.subscriptions_count)

      second_broadcast = broadcasts.second
      expect(second_broadcast['title']).to eq(broadcast2.title)
      expect(Time.parse(second_broadcast['broadcast_date'])).to eq(broadcast2.broadcast_date)
      expect(second_broadcast['subscriptions_count']).to eq(broadcast2.subscriptions_count)
    end
  end
end
