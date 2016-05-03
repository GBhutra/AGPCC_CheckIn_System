class AnalyzeController < ApplicationController
  def index
    @future_events = Event.all.where('start_time > ?', DateTime.now)
    @current_events = Event.all.where('start_time < ?', DateTime.now).where('end_time > ?', DateTime.now)
    @past_events = Event.all.where('end_time < ?', DateTime.now)
    @events = Event.pluck(:title)
    
  end
end
