class AddHostToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :host_user_id, :integer
  end
end
