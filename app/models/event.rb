class Event < ActiveRecord::Base
    validates :title, presence: true
    validates :venue, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    
    has_many :checkedin_members, class_name: 'CheckIn', foreign_key: :event_ID
    has_many :rsvped_members, class_name: 'Rsvp', foreign_key: :event_ID
    
    geocoded_by :venue
    after_validation :geocode

    def index
        @events = Event.order('id desc').all
    end
    
    scope :past_events,->{ where('end_time < ?', DateTime.now) }
    scope :future_events,->{ where('start_time > ?', DateTime.now) }
    
    def to_s
        title
    end
end
