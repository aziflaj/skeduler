require 'rails_helper'

RSpec.describe UpcomingSlotsForUser::Query do
  subject { described_class.new(user) }
  let(:user) { create :user }

  before do
    # Three free slots
    3.times { create :slot, user: user, guest_email: [nil, ''].sample }

    # Three booked slots
    3.times { create :slot, user: user, guest_email: FFaker::Internet.email }
  end

  it 'returns all booked slots' do
    expect(subject.call.count).to eq(3)
  end
end
