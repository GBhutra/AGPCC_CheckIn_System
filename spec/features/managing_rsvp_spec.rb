require 'spec_helper'

feature 'Managing Rsvps' do
#  scenario 'Guests cannot create events' do
#    visit root_path
#    expect(page).to_not have_link 'New Event'
#  end
#
#  context 'as an admin user' do
#    background do
#      email = 'admin@example.com'
#      password = 'password'
#      @admin = AdminUser.create(:email => email, :password => password)
#
#      log_in_admin_user
#    end
#
#    def log_in_admin_user(email = 'admin@example.com', password = 'password')
#      reset_session!
#      visit admin_root_path
#      fill_in 'Email', :with => email
#      fill_in 'Password', :with => password
#      click_button 'Login'
#    end
#
#    scenario 'Creating a Event with valid details' do
#      click_link 'Events'
#      click_link 'New Event'
#      fill_in 'event_title', :with => 'New Event'
#      fill_in 'event_description', :with => 'This Event was created from the Admin Interface'
#      fill_in 'event_venue', :with => 'HRBB, College Station, TX'
#      fill_in 'event_start_time', :with => 'April 11, 2017 10:00'
#      fill_in 'event_end_time', :with => 'April 13, 2017 08:00'
#      click_button 'Create'
#      expect(page).to have_content 'Event successfully created'
#      expect(page).to have_content 'New Event'
#    end
#    
#    scenario 'Creating a Event without title' do
#      click_link 'Events'
#      click_link 'New Event'
#      fill_in 'event_description', :with => 'This Event was created from the Admin Interface'
#      fill_in 'event_venue', :with => 'HRBB, College Station, TX'
#      fill_in 'event_start_time', :with => 'April 11, 2017 10:00'
#      fill_in 'event_end_time', :with => 'April 13, 2017 08:00'
#      click_button 'Create'
#      expect(page).to have_content "Title can't be blank"
#    end
#    
#    scenario 'Update a Event with valid details' do
#      click_link 'Events'
#      click_link 'Edit'
#      fill_in 'event_title', :with => 'Edited Event'
#      fill_in 'event_description', :with => 'This Event was edited from the Admin Interface'
#      click_button 'Update'
#      expect(page).to have_content 'Event updated successfully'
#      expect(page).to have_content 'Edited Event'
#    end
#    
#    scenario 'Update a Event with blank title' do
#      click_link 'Events'
#      click_link 'Edit'
#      fill_in 'event_title', :with => ''
#      click_button 'Update'
#      expect(page).to have_content "Title can't be blank"
#    end
#    
#    scenario 'Update a Event with blank title' do
#      click_link 'Events'
#      click_link 'Edit'
#      fill_in 'event_title', :with => ''
#      click_button 'Update'
#      expect(page).to have_content "Title can't be blank"
#    end
#    
#
#  end
end