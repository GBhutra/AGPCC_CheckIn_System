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
        actions
    end
    
    form multipart: true do |f|
        f.inputs "Event Details" do
            f.input :title, label: "Event Title"
            f.input :description, label: "Description"
        end
        f.inputs "Location Details" do
            f.input :venue, label: "Venue"
            
        end
        f.inputs "Timing Details" do
            f.input :start_time, as: :date_time_picker, datepicker_options: { min_date: (Date.today).strftime("%Y-%m-%d") , max_date: (Date.today+1000).strftime("%Y-%m-%d"), minTime:'11:00' }
            f.input :end_time, as: :date_time_picker, datepicker_options: { min_date: (Date.today).strftime("%Y-%m-%d"), max_date: (Date.today+1000).strftime("%Y-%m-%d"), minTime:'11:00' }
        end
        f.actions
    end
end
