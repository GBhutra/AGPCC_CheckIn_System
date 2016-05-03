# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^Home/
      '/'
   
    when /^Events/
     'admin/events'
  
   when /^New Event/
      'events/new'
      
    when /^First Event/
     'events/100'
     
    when /^Second Event/
      "events/200"
    
    when /^Third Event/
      "events/300"
      
    when /^Edit Event/
      '100/edit'
      
    when /^Check In/
      'check_in/200/new'
      
    when /^R.S.V.P./
      'rsvp/100/new'
# added later                                 # This needs to change
#    when /^Online Checkin/
#      '/#'
#    when /Checkin/
#      '/check_in/1/new'
      
#    when /RSVP/
#     '/rsvp/2/new'      
   
     
     
     
     
     
     
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
