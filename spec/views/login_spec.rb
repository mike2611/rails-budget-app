require 'rails_helper'

RSpec.describe 'Devise forms', type: :system do
  describe 'Log in' do
    before(:each) do
      visit root_path
      sleep(3)
    end

    it 'shows the correct content' do
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Log in')
    end

    it 'shows the correct validation message for user email' do
      click_button 'Log in'
      message = page.find('#user_email').native.attribute('validationMessage')
      expect(message).to eq 'Please fill out this field.'
    end

    it 'shows the correct validation message for user password' do
      click_button 'Log in'
      fill_in 'user_email', with: 'test@email.com'
      message = page.find('#user_password').native.attribute('validationMessage')
      expect(message).to eq 'Please fill out this field.'
    end

    it 'shows the correct validation message for email after filling user email' do
      click_button 'Log in'
      fill_in 'user_email', with: 'test'
      message = page.find('#user_email').native.attribute('validationMessage')
      expect(message).to eq "Please include an '@' in the email address. 'test' is missing an '@'."
    end
  end
end
