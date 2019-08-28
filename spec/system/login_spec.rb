require 'rails_helper'

RSpec.describe 'Login' do
  let(:user) { create :user }

  before do
    visit root_path
    expect(body).to have_link('Log In')
  end

  context 'with valid params' do
    let(:password) { 'password' }

    it 'logs in with username' do
      click_link 'Log In'

      within(:css, 'form') do
        fill_in 'Username or Email', with: user.username
        fill_in 'Password', with: password

        find('[type="submit"]').click
      end

      expect(page).to have_link('Log Out')
    end

    it 'logs in with email' do
      click_link 'Log In'

      within(:css, 'form') do
        fill_in 'Username or Email', with: user.email
        fill_in 'Password', with: password

        find('[type="submit"]').click
      end

      expect(page).to have_link('Log Out')
    end
  end

  context 'with invalid params' do
    let(:password) { '12345678' }

    it 'does not log in with username' do
      click_link 'Log In'

      within(:css, 'form') do
        fill_in 'Username or Email', with: user.username
        fill_in 'Password', with: password

        find('[type="submit"]').click
      end

      expect(page).to have_text('Invalid Login or password')
    end

    it 'does not log in with email' do
      click_link 'Log In'

      within(:css, 'form') do
        fill_in 'Username or Email', with: user.email
        fill_in 'Password', with: password

        find('[type="submit"]').click
      end

      expect(page).to have_text('Invalid Login or password')
    end
  end
end
