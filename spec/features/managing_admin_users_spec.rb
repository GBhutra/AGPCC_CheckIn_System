
require 'spec_helper'

feature 'Managing Admin users' do
  scenario 'Guests cannot create Admins' do
    visit root_path
    expect(page).to_not have_link 'New Admin User'
  end

  context 'as an admin user' do
    background do
      email = 'admin@example.com'
      password = 'password'
      @admin = AdminUser.create(:email => email, :password => password)

      log_in_admin_user
    end

    def log_in_admin_user(email = 'admin@example.com', password = 'password')
      reset_session!
      visit admin_root_path
      fill_in 'Email', :with => email
      fill_in 'Password', :with => password
      click_button 'Login'
    end

    scenario 'creating a new Admin User' do
      click_link 'Admin Users'
      click_link 'New Admin User'

      fill_in 'admin_user_email', :with => 'admin1@example.com'
      fill_in 'admin_user_password', :with => 'password'
      fill_in 'admin_user_password_confirmation', :with => 'password'
      click_button 'Create Admin user'
      expect(page).to have_content 'admin1@example.com'
      expect(page).to have_content 'Admin user was successfully created.'
    end
    
  end
end
