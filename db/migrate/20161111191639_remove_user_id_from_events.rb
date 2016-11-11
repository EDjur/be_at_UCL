class RemoveUserIdFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :user_id, :string, {}
  end
end
