require 'spec_helper'

feature 'Managing Rsvps' do
    visit root_path
    expect(page).to_not have_link 'New Event'
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

    scenario 'RSVPing in a member' do
    click_link 'RSVPS'
    click_link 'New Rsvp'
    select(@member.email, :from => 'Member')
    select(@event.title, :from => 'Event')
    click_button 'Create Rsvp'
    expect(page).to have_content "Rsvp was successfully created."
   end
    
    scenario 'Creating an ERSVP without Member' do
    click_link 'RSVPS'
    click_link 'New Rsvp'
    select(@member.email, :from => '')
    select(@event.title, :from => 'Event')
    click_button 'Create Rsvp'
    expect(page).to have_content "Choose an Email"
   end

  end
end