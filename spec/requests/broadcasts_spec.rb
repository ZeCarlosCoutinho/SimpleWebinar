require 'rails_helper'

RSpec.describe "Broadcasts", type: :request do
  let!(:broadcast1) { Broadcast.create(title: "Broadcast 1", broadcast_date: Time.zone.now) }
  let!(:broadcast2) { Broadcast.create(title: "Broadcast 2", broadcast_date: Time.zone.now - 1.day) }

  describe "GET /index" do
    it "returns http success" do
      get "/broadcasts"
      expect(response).to have_http_status(:success)
    end

    it "returns the list of broadcasts" do
      get "/broadcasts"
      broadcasts = JSON.parse(response.body)

      first_broadcast = broadcasts.first
      expect(first_broadcast['title']).to eq(broadcast1.title)
      expect(DateTime.parse(first_broadcast['broadcast_date'])).to eq(broadcast1.broadcast_date)
      expect(first_broadcast['subscriptions_count']).to eq(broadcast1.subscriptions_count)

      second_broadcast = broadcasts.second
      expect(second_broadcast['title']).to eq(broadcast2.title)
      expect(DateTime.parse(second_broadcast['broadcast_date'])).to eq(broadcast2.broadcast_date)
      expect(second_broadcast['subscriptions_count']).to eq(broadcast2.subscriptions_count)
    end
  end
end
