ActiveAdmin.register CheckIn do

permit_params :member_id, :event_id
#member_id = @check_ins.member

index do
    column :event_id
    column :member_id
    actions
end

#form do |f|
#    f.inputs "Check In Details" do
#        f.input :member_id, label: "Member ID"   
#        f.input :event_id, label: "Event ID"   
#    end
#    f.actions     
#end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :li:attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
