require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_length_of(:password).is_at_least(8) }
  it { should validate_uniqueness_of(:username).case_insensitive }
end
