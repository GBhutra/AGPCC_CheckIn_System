require 'rails_helper'

RSpec.describe Event, type: :model do
  
  describe Event do
      describe 'validations' do
          subject(:event) { Event.new } # sets the subject of this describe block
          before { event.valid? }      # runs a precondition for the test/show
          [:title, :venue, :start_time, :end_time ].each do |attribute|
              it "should validate presence of #{attribute}" do
                  expect(event.errors.messages[attribute]).to include "can't be blank"
                end
            end
        end
    end 
    
    
    
end
