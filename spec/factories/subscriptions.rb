FactoryBot.define do
  factory :subscription do
    sequence(:email) { |n| "test#{n}@example.com" }
    firstname { "Han" }
    surname { "Solo" }
    registration_ip { "111.222.333.444" }
    broadcast { FactoryBot.create(:broadcast) }
  end
end
