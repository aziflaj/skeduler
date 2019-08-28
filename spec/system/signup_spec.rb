require 'rails_helper'

RSpec.describe 'Signup' do
  let(:user) { build :user }

  before do
    visit root_path
    expect(body).to have_link('Sign Up')
  end

  context 'with valid params' do
    let(:password) { 'password' }

    it 'creates the user account and signs them in' do
      click_link 'Sign Up'

      within(:css, 'form') do
        fill_in 'Email', with: user.email
        fill_in 'Username', with: user.username
        fill_in 'Password', with: password
        fill_in 'Password Confirmation', with: password

        find('[type="submit"]').click
      end

      expect(page).to have_link('Log Out')
    end
  end

  context 'with short password' do
    let(:password) { '1234' }

    it 'does not create an account' do
      click_link 'Sign Up'

      within(:css, 'form') do
        fill_in 'Email', with: user.email
        fill_in 'Username', with: user.username
        fill_in 'Password', with: password
        fill_in 'Password Confirmation', with: password

        find('[type="submit"]').click
      end

      expect(page).to have_text('Password is too short')
    end
  end
end
