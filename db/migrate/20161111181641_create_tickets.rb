class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :event_id
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
