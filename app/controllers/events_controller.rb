class EventsController < ApplicationController
  def index
    @future_events = Event.all.where('start_time > ?', DateTime.now)
    @current_events = Event.all.where('start_time < ?', DateTime.now).where('end_time > ?', DateTime.now)
  end

  def show
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, :notice => "Event Successfully Created"
    else
      render "new"
    end
  end
  
  private
  def event_params
    params.require(:event).permit(:title, :description, :venue, :ticket_price, :start_time, :end_time, :longitude, :latitude )
  end
end
