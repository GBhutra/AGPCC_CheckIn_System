class Rsvp < ActiveRecord::Base
    belongs_to :member
    belongs_to :event
    validates :member_id,:presence => {:message => "Choose an Email"}, :allow_blank => false,:uniqueness => { :case_sensitive => false }
    validates :event_id,:presence => {:message => "Choose an Event"}, :allow_blank => false,:uniqueness => { :case_sensitive => false }
    validates_uniqueness_of :member_id, scope: :event_id, :message => 'Already RSVPed !!'
    
    scope :rsvp_list, -> {Rsvp.group(:event_id).count}
end
#tester for cucumber. just seeing if my commits are working. 