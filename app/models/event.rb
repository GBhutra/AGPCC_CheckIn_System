class Event < ActiveRecord::Base
    validates :title, presence: true
    validates :venue, presence: true
    validates :ticket_price, presence: true
    
    def index
        @events = Event.order('id desc').all
    end
    
    geocoded_by :venue
    after_validation :geocode
    
    scope :past_events,->{ where('end_time < ?', DateTime.now) }
    scope :future_events,->{ where('start_time > ?', DateTime.now) }
    #scope :ongoing_events,->{ where('date == ?', Date.today) }
end
