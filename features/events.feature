Feature: Viewing Dashboard and Updating Events 
  
  As an admin
  So that I can see events such as ongoing, upcaming and past
  I want to click to the name of events and being able to update events
  
Background: events have been added to database
  
Given the following events exist:
  
  | title                   | description   | venue             | date         | start_time | end_time  | ticket_price | id  | 
  | First Event             | firstevent    | firstlocation     | 25-November-2014  | 1          | 2         | free         | 100 |
  | Second Event            | secondevent   | secondlocation    | 26-Oct-2015  | 3          | 4         | 5            | 200 |
  | Third Event             | thirdevent    | thirdlocation     | 21-Jul-2017  | 6          | 7         | free         | 300 |

  
Scenario: viewing First Event Details
  When I login successfully
  Then I should be on Dashboard
  When I follow Events
  Then I should be on Events
  When I follow First Event
  Then I should be on First Event
  
Scenario: viewing First Event Details
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
  When I fill in description with fakedescription
  And I fill in venue with fakelocation
  And I fill in start_time with 8
  And I fill in end_time with 9
  And I fill in ticket_price with 10
  And I select in date(1i) with 2017
  And I select in date(2i) with January
  And I select in date(3i) with 20
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
  When I fill in description with fakedescription2
  And I fill in venue with fakelocation2
  And I fill in start_time with 11
  And I fill in end_time with 12
  And I fill in ticket_price with 13
  And I select in date(1i) with 2016
  And I select in date(2i) with January
  And I select in date(3i) with 18
  And I press "Update Event"
  Then I should get the message Event was successfully updated

  