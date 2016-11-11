class AddTicketsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :available_tickets, :number
  end
end
