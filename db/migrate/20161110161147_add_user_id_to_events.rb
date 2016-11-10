class AddUserIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :user_id, :string
  end
end
