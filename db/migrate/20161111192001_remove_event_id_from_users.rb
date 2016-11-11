class RemoveEventIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :event_id, :string
  end
end
