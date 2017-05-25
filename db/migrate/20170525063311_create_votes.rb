class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :correspondence_id
      t.integer :restaurant_id
      t.integer :rating

      t.timestamps null: false
    end
  end
end
