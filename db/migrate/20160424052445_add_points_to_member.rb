class AddPointsToMember < ActiveRecord::Migration
  def change
    add_column :members, :points, :integer, default: 0
  end
end
