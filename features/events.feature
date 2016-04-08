Feature: Viewing Dashboard and Updating Events 
  
  As an admin
  So that I can see events such as ongoing, upcaming and past
  I want to click to the name of events and being able to update events
  
Background: events have been added to database
  
Given the following events exist:
  
  | title                   | description   | venue             | date         | start_time | end_time  | ticket_price |
  | First Event             | firstevent    | firstlocation     | 25-Nov-2014  | 1          | 2         | free         |
  | Second Event            | secondevent   | secondlocation    | 26-Oct-2015  | 3          | 4         | 5            |
  | Third Event             | thirdevent    | thirdlocation     | 21-Jul-2016  | 6          | 7         | free         |


Scenario: create new event
  When I follow "Events"
  When I follow "New event"
  And I go to the Create event page
  And I fill in "title" with "fakeevent"
  And I fill in "description" with "fakedescription"
  And I fill in "venue" with "fakelocation"
  And I fill in "date" with "01-Jan-2000"
  And I fill in "start_time" with "8"
  And I fill in "end_time" with "9"
  And I fill in "ticket_price" with "10"
  And I press "save changes"
  Then I should see title "fakeevent"
  And I should see description "fakedescription"
  And I should see venue "fakelocation"
  And I should see date "01-Jan-2000"
  And I should see start_time "8"
  And I should see end_time "9"
  And I should see ticket_price "10"
  
  
Scenario: Updating an event
  When I follow "First Event"
  And go to the First event's page
  And I follow "Edit Event"
  And I fill in "title" with "fakeevent2"
  And I fill in "description" with "fakedescription2"
  And I fill in "venue" with "fakelocation2"
  And I fill in "start_time" with "11"
  And I fill in "end_time" with "12"
  And I fill in "ticket_price" with "free"
   And I fill in "date" with "01-Jan-2002"
   
  And I press "save changes"
  Then I should see updated title "fakeevent2"
  And I should see updated description "fakedescription2"
  And I should see updated venue "fakelocation2"
  And I should see updated date "01-Jan-2002"
  And I should see updated start_time "11"
  And I should see updated end_time "12"
  And I should see updated ticket_price "free"
  
  
 
  
  