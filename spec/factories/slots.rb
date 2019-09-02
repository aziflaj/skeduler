FactoryBot.define do
  factory :slot do
    user
    guest_email { FFaker::Internet.email }
    scheduled_at { 10.minutes.from_now }
    notes { '' }
  end
end
