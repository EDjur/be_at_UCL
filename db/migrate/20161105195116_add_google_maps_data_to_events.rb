class AddGoogleMapsDataToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :street, :string
    add_column :events, :street_number, :string
    add_column :events, :city, :string
  end
end
