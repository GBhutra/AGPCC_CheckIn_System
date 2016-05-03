ActiveAdmin.register Rsvp do

permit_params :member_id, :event_id

index do
    column :event_id
    column :member_id   
    actions
end
end
