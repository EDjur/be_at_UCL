class AddTicketSalesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :tickets_sold, :integer
  end
end
