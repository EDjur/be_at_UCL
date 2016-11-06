class AddStreetToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :street, :string
  end
end
