require 'rails_helper'

RSpec.describe 'Dashboard' do
  context 'for authenticated user' do
    let(:user) { create :user }

    before do
      sign_in user
    end

    it 'shows the dashboard' do
      visit dashboard_path
      expect(page).to have_text('Welcome')
    end
  end

  context 'for not authenticated user' do
    it 'requires authentication' do
      visit dashboard_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
