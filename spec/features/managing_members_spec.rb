require 'spec_helper'

feature 'Managing Members' do
    
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
    
        scenario 'Creating a member with valid details' do
          click_link 'Members'
          click_link 'New Member'
          fill_in 'member_first_name', :with => 'John'
          fill_in 'member_last_name', :with => 'Doe'
          fill_in 'member_email', :with => 'JohnDoe@example.com'
          select('Male', :from => 'member_gender')
          select('Master', :from => 'member_classification')
          click_button 'Create Member'
          
          expect(page).to have_content 'Member was successfully created.'
          expect(page).to have_content 'JohnDoe@example.com'
        end    
    end

    context 'with an existing member' do
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
            log_in_admin_user
        end
        
        def log_in_admin_user(email = 'admin@example.com', password = 'password')
          reset_session!
          visit admin_root_path
          fill_in 'Email', :with => email
          fill_in 'Password', :with => password
          click_button 'Login'
        end
        
        scenario 'edit first name of the member' do
            click_link 'Members'
            click_link 'Edit'
            
            fill_in 'member_first_name', :with => 'Jill'
            click_button 'Update Member'
            expect(page).to have_content 'Member was successfully updated.'
        end 
        
        scenario 'edit last name of the member' do
            click_link 'Members'
            click_link 'Edit'
            
            fill_in 'member_first_name', :with => 'Dove'
            click_button 'Update Member'
            expect(page).to have_content 'Member was successfully updated.'
        end
    end
end
