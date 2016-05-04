class CheckIn < ActiveRecord::Base
    belongs_to :member, :class_name => Member
    belongs_to :event, :class_name => Event
    
    scope :checkin_list, -> {CheckIn.group(:event_id).count}
    validates :member_id,:presence => {:message => "Choose an Email"}, :allow_blank => false,:uniqueness => { :case_sensitive => false }
    validates :event_id,:presence => {:message => "Choose an Event"}, :allow_blank => false,:uniqueness => { :case_sensitive => false }
    
    validates_uniqueness_of :member_id, scope: :event_id, :message => 'Already checked in !!'
end
