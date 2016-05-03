class CheckIn < ActiveRecord::Base
    belongs_to :member, :class_name => Member
    belongs_to :event, :class_name => Event
    
    scope :checkin_list, -> {CheckIn.group(:event_id).count}
    
    validates_uniqueness_of :member_id, scope: :event_id, :message => 'Already checked in !!'
end
