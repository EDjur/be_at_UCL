class AddTicketsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :tickets, :number
  end
end
