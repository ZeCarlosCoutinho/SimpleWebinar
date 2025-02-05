FactoryBot.define do
  factory :broadcast do
    title { 'Example Broadcast' }
    broadcast_date { Time.zone.now }
  end
end
