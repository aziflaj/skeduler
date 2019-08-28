FactoryBot.define do
  factory :user do
    username { FFaker::Lorem.words.join('') }
    email { FFaker::Internet.email }
    password { 'password' }
  end
end
