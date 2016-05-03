require 'rails_helper'

RSpec.describe Member, type: :model do
  
  describe Member do
      describe 'validations' do
          subject(:event) { Member.new }       # sets the subject of this describe block
          before { event.valid? }               # runs a precondition for the test/show
          [:first_name, :last_name, :email, :gender, :classification ].each do |attribute|
              it "should validate presence of #{attribute}" do
                  expect(event.errors.messages[attribute]).to include "can't be blank"
                end
            end
        end
    end 
  
end
