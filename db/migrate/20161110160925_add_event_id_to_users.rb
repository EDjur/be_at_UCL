class AddEventIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :event_id, :string
  end
end
