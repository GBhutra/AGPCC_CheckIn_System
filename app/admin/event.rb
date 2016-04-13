ActiveAdmin.register Event do

    permit_params :title, :description, :venue, :start_time, :end_time, :ticket_price
    
    scope :past_events
    scope :future_events
    
    #scope :ongoing_events
    
    index do
        column :title
        column :venue
        column :start_time
        column :end_time
        column :ticket_price
        actions
    end
    
    form multipart: true do |f|
        f.inputs "Event Details" do
            f.input :title, label: "Event Title"
            f.input :description, label: "Description"
        end
        f.inputs "Location Details" do
            f.input :venue, label: "Venue"
            f.input :longitude, label: "Longitude"
            f.input :latitude, label: "Latitude"
        end
        f.inputs "Timing Details" do
            f.input :start_time, label: "Start Time"
            f.input :end_time, label: "End Time"
        end
        f.inputs "Ticket Details" do
            f.input :ticket_price, label: "Ticket price" 
        end
        f.actions
    end
end
