class AddStreetNumberToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :street_number, :string
  end
end
