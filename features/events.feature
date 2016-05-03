Feature: Viewing Dashboard and Updating Events 
  
  As an admin
  So that I can see events such as ongoing, upcaming and past
  I want to click to the name of events and being able to update events
  
Background: events have been added to database
  
Given the following events exist:
  
  | title                   | description   | venue             | longitude | latitude | start_time      | end_time     | ticket_price | id  | 
  | First Event             | firstevent    | firstlocation     |-90.0000000|20.0000000| 2017-April-11-10-00    |2017-April-11-11-00  |free          | 100 |
  | Second Event            | secondevent   | secondlocation    | 30.0000000|40.0000000|2017-April-12-10-00     |2017-April-12-11-00  | 5            | 200  |
  | Third Event             | thirdevent    | thirdlocation     |-15.0000000|25.0000000|2017-April-13-10-00     |2017-April-13-11-00  | free         | 300  |

  
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
  And I fill in event[longitude] with -90.0000000
  And I fill in event[latitude] with 20.0000000
  And I select in start_time(1i) with 2017
  And I select in start_time(2i) with April
  And I select in start_time(3i) with 10
  And I select in start_time(4i) with 10
  And I select in start_time(5i) with 00
  And I select in end_time(1i) with 2017
  And I select in end_time(2i) with April
  And I select in end_time(3i) with 10
  And I select in end_time(4i) with 11
  And I select in end_time(5i) with 00
  And I fill in event[ticket_price] with 10
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
  And I fill in event[venue] with fakelocation2
  And I fill in event[longitude] with -50.0000000
  And I fill in event[latitude] with 20.0000000
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
  And I fill in member[gender] with Male
  And I fill in member[classification] with Masters
  And I press "RSVP"
  Then I should get the message Thank you for RSVPing!
   When I am on R.S.V.P. page
   And I fill in member[email] with aman@gmail.com
   And I press "R.S.V.P"
   Then I should get the message Thank you for RSVPing!
  
Scenario: CheckIn
  When I am on Check In page
  And I fill in member[email] with amandeep@gmail.com
  And I press "Check In"
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
