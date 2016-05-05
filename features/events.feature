Feature: Viewing Dashboard and Updating Events 
  
  As an admin
  So that I can see events such as ongoing, upcaming and past
  I want to click to the name of events and being able to update events
  
Background: events have been added to database
  
Given the following events exist:
  

  | title                   | description   | venue                        | start_time                      | end_time                      | id  | 
  | First Event             | firstevent    | HRBB, College Station, TX    | 2016-04-11T10:00:00.000-0500    | 2017-05-12T10:00:00.000-0500  | 100 |
  | Second Event            | secondevent   | HRBB, College Station, TX    | 2017-05-13T10:00:00.000-0500    | 2017-05-14T10:00:00.000-0500  | 200  |
  | Third Event             | thirdevent    | HRBB, College Station, TX    | 2017-05-15T10:00:00.000-0500    | 2017-05-16T10:00:00.000-0500  | 300  |

Scenario: viewing First Event Details
  When I login successfully
  Then I should be on Dashboard
  When I follow Events
  Then I should be on Events
  When I follow First Event
  Then I should be on First Event
  
Scenario: viewing Second Event Details
  When I login successfully
  Then I should be on Dashboard
  When I follow Events
  Then I should be on Events
  When I follow Second Event
  Then I should be on Second Event
  
  
Scenario: viewing Third Event Details
  When I login successfully
  Then I should be on Dashboard
  When I follow Events
  Then I should be on Events
  When I follow Third Event
  Then I should be on Third Event
  # When I follow Second Event
  # Then I should see title "Second Event"
  # And I should see description "secondevent"
  # And I should see venue "secondlocation"
  # And I should see start_time "3"
  # And I should see end_time "4"
  # And I should see ticket_price "5"

Scenario: As an Admin Create a New member
  When I login successfully
  Then I should be on Dashboard
  When I follow Members
  Then I should be on Members
  When I follow New Member
  Then I should be on New Member
  When I fill in member[first_name] with Test
  And I fill in member[last_name] with Test
  And I fill in member[email] with test@test.com
  And I select in member[gender] with Male
  And I select in member[classification] with Master
  And I press "Create Member"
  Then I should get the message Member was successfully created.
  
Scenario: As an Admin Create an other Admin
  When I login successfully
  Then I should be on Dashboard
  When I follow Admin Users
  Then I should be on Admin Users
  When I follow New Admin User
  Then I should be on New Admin User
  When I fill in admin_user[email] with test@admin.com
  And I fill in admin_user[password] with 123456789
  And I fill in admin_user[password_confirmation] with 123456789
  And I press "Create Admin user"
  Then I should get the message Admin user was successfully created.

Scenario: create new event
  When I login successfully
  Then I should be on Dashboard
  When I follow Events
  Then I should be on Events
  When I follow New Event
  Then I should be on New Event
  When I fill in event[title] with Event_One
  And I fill in event[description] with fakedescription
  And I fill in event[venue] with fakelocation
  And I fill in start_time with 2016-04-11T10:00:00.000-0500 
  And I select in end_time with 2017-04-11T10:00:00.000-0500
  And I press "Create Event"
  Then I should get the message Event was successfully created
  
Scenario: Updating an Event
  When I login successfully
  Then I should be on Dashboard
  When I follow Events
  Then I should be on Events
  When I follow First Event
  And I follow Edit Event
  Then I should be on Edit Event
  When I fill in event[title] with Event_two
  And I fill in event[description] with fakedescription2
  And I fill in event[venue] with fakelocation
  And I select in start_time(1i) with 2017
  And I select in start_time(2i) with April
  And I select in start_time(3i) with 10
  And I select in start_time(4i) with 11
  And I select in start_time(5i) with 00
  And I select in end_time(1i) with 2017
  And I select in end_time(2i) with April
  And I select in end_time(3i) with 10
  And I select in end_time(4i) with 12
  And I select in end_time(5i) with 00
  And I fill in event[ticket_price] with 13
  And I press "Update Event"
  Then I should get the message Event was successfully updated
  

    
Scenario: RSVP
  When I am on R.S.V.P. page
  And I fill in member[email] with aman@gmail.com
  And I press "R.S.V.P"
  Then I should be on Looks like you are signing in for the first time
  When I fill in member[first_name] with Aman
  And I fill in member[last_name] with Bhal
  And I fill in member[email] with aman@gmail.com
  And I select in member[gender] with Male
  And I select in member[classification] with Master
  And I press "R.S.V.P"
  Then I should get the message Thank you for RSVPing!
   When I am on R.S.V.P. page
   And I fill in member[email] with aman@gmail.com
   And I press "R.S.V.P"
   Then I should get the message Already RSVPed !!
  
Scenario: CheckIn
  When I am on Check In page
  And I fill in member[email] with aman@gmail.com
  And I press "Check In"
  Then I should get the message Email error please enter valid details!
  Then I should be on Looks like you are checking in for the first time
  When I fill in member[first_name] with Amandeep
  And I fill in member[last_name] with Bhal
  And I fill in member[email] with amandeep@gmail.com
  And I fill in member[gender] with Male
  And I fill in member[classification] with Masters
  And I press "Check In"
  Then I should get the message Check in Successful
  When I am on Check In page
  And I fill in member[email] with amandeep@gmail.com
  And I press "Check In"
  Then I should get the message Check in Successful


#Feature: Managing Members
  
#  As an admin
#  So that I can see members
#  I want to click to the email to member and want to see members details 
  
#Background: members have been added to database
  
#Given the following members exist:
  
#  | first_name | last_name  | email             | gender | classification | id  | 
#  | test1      | test1      | test1@example.com | male   | Master         | 150 |
#  | test2      | test2      | test2@example.com | female | Ph.D.          | 250 |
  
Scenario: Check in Member as an Admin
  When I login successfully
  Then I should be on Dashboard
  When I follow Check Ins
  Then I should be on Check Ins
  When I follow New Check In
  Then I should be on New Check In
  When I select in Member with test1@example.com
  And I select in Event with First Event
  And I press "Create Check in"
  Then I should get the message Check in was successfully created.
  
  Scenario: RSVP Member as an Admin
  When I login successfully
  Then I should be on Dashboard
  When I follow Rsvps
  Then I should be on Rsvps
  When I follow New Rsvp
  Then I should be on New Rsvp
  When I select in Member with test2@example.com
  And I select in Event with Second Event
  And I press "Create Rsvp"
  Then I should get the message Rsvp was successfully created.
  
#Feature: Managing Admins
  
#  As an admin
#  So that I can see Admins
#  I want to change the admin password 
  
#Background: admins have been added to database
  
#Given the following members exist:
  
#  | admin_user_email      | admin_user_password  | admin_user_password_confirmation | id  | 
#  | admin1@example.com    | 12345678             | 12345678                         | 125 |
#  | admin2@example.com    | 87654321             | 87654321                         | 225 |
  
  
Scenario: Edit Admin
  When I login successfully
  Then I should be on Dashboard
  When I follow Admin Users
  Then I should be on Admin Users
  When I follow Edit
  Then I should be on Edit Admin User
  When I fill in admin_user[email] with admin@example.com
  And I fill in admin_user[password] with password
  And I fill in admin_user[password_confirmation] with password