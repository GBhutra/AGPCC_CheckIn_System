
# Add a declarative step here for populating the DB with competitions.
Given /^the following events exist:$/ do |events_table|
events_table.hashes.each do |event|
Event.create!(event)
# each returned element will be a hash whose key is the table header.
# you should arrange to add that event to the database here.
end
end
Then /I should see title "([^"]*)"/ do |arg|
page.should have_content arg
end

Then /I should see description "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see venue "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see longitude "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see latitude "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see date "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see start_time "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see end_time "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see ticket_price "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see updated title "([^"]*)"/ do |arg|
page.should have_content arg
end

Then /I should see updated description "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see updated venue "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see updated longitude "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see updated latitude "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end


Then /I should see updated date "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see updated start_time "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see updated end_time "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

Then /I should see updated ticket_price "([^"]*)"/ do |arg|
page.body.should match /#{arg}/m
end

# When /^I fill in (.+)/ do |field|
#   fill_in("event[#{field}]")
# end

When /^I fill in (.+) with (.+)$/ do |field, value|
  fill_in(field, :with => value)
end


def create_visitor
@visitor ||= { :email => "admin@example.com",
:password => "password", :password_confirmation => "password" }
end

def sign_in
visit admin_root_path                                       #earlier: visit
fill_in("admin_user[email]", :with => "admin@example.com")
fill_in("admin_user[password]", :with => "password")
click_button("Login")                       
end

def create_user
create_visitor
delete_user
@user = AdminUser.create(@visitor)                           #try with User.new
end

def delete_user
@user ||= AdminUser.where(:email => @visitor[:email]).first
@user.destroy unless @user.nil?
end

When /^I login successfully$/ do
  create_visitor
  create_user
  sign_in
end

When /^I am on (.+) page$/ do |page|
  if page=="Home"
    visit root_path
  else
    visit path_to(page)
  end
end

When /^I login$/ do
    fill_in("admin_user[email]", :with => "admin@example.com")
    fill_in("admin_user[password]", :with => "password")
    click_button("Login")
end

Then /^I should be on (.+)$/ do |text|
  page.should have_content text
end

When /^I follow (.+)$/ do |link|
  visit path_to(link)
end


Then /^I should get the message (.+)$/ do |msg|
  page.should have_content msg
end

When /^I select in (.+) with (.+)$/ do |field,value|
  page.select(value, :from => "event[#{field}]")
end