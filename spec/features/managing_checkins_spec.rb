require 'spec_helper'

feature 'Managing Check ins' do

 context 'as an admin user' do
   background do
    admin_email = 'admin@example.com'
    password = 'password'
    email = "John@example.com"
    first_name = "John"
    last_name = "Doe"
    gender = "Male"
    classification = "Master"
    @member = Member.create(:email => email, :first_name => first_name, :last_name => last_name, :gender => gender, :classification => classification )
    @admin = AdminUser.create(:email => admin_email, :password => password)
    @event = Event.create(title: "Current Event", description: "This is an on going Event", venue: "WCL, Texas A&M University, College Station, Texas,...", created_at: "2016-04-12 01:44:14", updated_at: "2016-04-12 01:44:14", longitude: -96.3579087, latitude: 30.5894709, start_time: "2016-04-11 20:00:00", end_time: "2017-04-11 18:00:00") 
    log_in_admin_user
   end

   def log_in_admin_user(email = 'admin@example.com', password = 'password')
    reset_session!
    visit admin_root_path
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click_button 'Login'
   end
   
   scenario 'Checking in a member' do
    click_link 'Check Ins'
    click_link 'New Check In'
    select(@member.email, :from => 'Member')
    select(@event.title, :from => 'Event')
    click_button 'Create Check in'
    expect(page).to have_content "Check in was successfully created."
   end
   
  end
end
   #scenario 'Creating a Checkin with valid details' do
   #  click_link 'CHECK INS'
   #  click_link 'New Check In'
   #  fill_in 'event_title', :with => 'New Event'
   #  fill_in 'event_description', :with => 'This Event was created from the Admin Interface'
   #  fill_in 'event_venue', :with => 'HRBB, College Station, TX'
   #  fill_in 'event_start_time', :with => 'April 11, 2017 10:00'
   #  fill_in 'event_end_time', :with => 'April 13, 2017 08:00'
   #  click_button 'Create'
   #  expect(page).to have_content 'Event successfully created'
   #  expect(page).to have_content 'New Event'
   #end
#   
#   scenario 'Creating a Event without title' do
#     click_link 'Events'
#     click_link 'New Event'
#     fill_in 'event_description', :with => 'This Event was created from the Admin Interface'
#     fill_in 'event_venue', :with => 'HRBB, College Station, TX'
#     fill_in 'event_start_time', :with => 'April 11, 2017 10:00'
#     fill_in 'event_end_time', :with => 'April 13, 2017 08:00'
#     click_button 'Create'
#     expect(page).to have_content "Title can't be blank"
#   end
#   
#   scenario 'Update a Event with valid details' do
#     click_link 'Events'
#     click_link 'Edit'
#     fill_in 'event_title', :with => 'Edited Event'
#     fill_in 'event_description', :with => 'This Event was edited from the Admin Interface'
#     click_button 'Update'
#     expect(page).to have_content 'Event updated successfully'
#     expect(page).to have_content 'Edited Event'
#   end
#   
#   scenario 'Update a Event with blank title' do
#     click_link 'Events'
#     click_link 'Edit'
#     fill_in 'event_title', :with => ''
#     click_button 'Update'
#     expect(page).to have_content "Title can't be blank"
#   end
#   
#   scenario 'Update a Event with blank title' do
#     click_link 'Events'
#     click_link 'Edit'
#     fill_in 'event_title', :with => ''
#     click_button 'Update'
#     expect(page).to have_content "Title can't be blank"
#   end
#   

# end
