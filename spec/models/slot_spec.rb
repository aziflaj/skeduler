require 'rails_helper'

RSpec.describe Slot, type: :model do
  subject { build :slot }

  it { should belong_to(:user).dependent(:destroy).required }

  # email validation
  it { should validate_presence_of(:guest_email) }
  it { should allow_value('test@mail.com').for(:guest_email) }
  it { should_not allow_value('mail.com').for(:guest_email) }
  it { should_not allow_value('test').for(:guest_email) }

  it 'is valid when scheduled at least 5 minutes from now' do
    subject.scheduled_at = 2.minutes.ago
    expect(subject).not_to be_valid

    subject.scheduled_at = 5.minutes.from_now
    expect(subject).to be_valid
  end

  it 'is not valid when scheduled in the past' do
    subject.scheduled_at = 5.minutes.ago
    expect(subject).not_to be_valid
  end
end
