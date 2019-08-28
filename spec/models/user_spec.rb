require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_length_of(:password).is_at_least(8) }
  it { should validate_uniqueness_of(:username).case_insensitive }

  it 'does not allow special characters in username' do
    invalid_usernames = %w[@james r!chard $teve 9gag]
    user = User.new(email: 'random@mail.com', password: 'password')

    invalid_usernames.each do |username|
      user.username = username
      expect(user).not_to be_valid
    end
  end
end
