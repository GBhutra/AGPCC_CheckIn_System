class RemoveEndTimeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :end_time, :time
  end
end
