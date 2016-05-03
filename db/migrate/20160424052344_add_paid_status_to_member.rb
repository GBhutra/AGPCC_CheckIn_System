class AddPaidStatusToMember < ActiveRecord::Migration
  def change
    add_column :members, :paid_status, :boolean, default: false
  end
end
