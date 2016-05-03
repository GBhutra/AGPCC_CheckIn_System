ActiveAdmin.register_page "Dashboard" do
#ActiveAdmin::Dashboards.build do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    
    columns do
      column do
        panel "Recent Events" do
          table_for Event.order('id desc').limit(10) do
            column "Event Title", :title do |event|
              link_to event.title,[:admin,event]
            end
            column :venue
            column :start_time
            column :end_time
          end
        end
      end
    end
  end
end
