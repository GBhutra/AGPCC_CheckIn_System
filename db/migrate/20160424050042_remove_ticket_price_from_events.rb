class RemoveTicketPriceFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :ticket_price, :string
  end
end
