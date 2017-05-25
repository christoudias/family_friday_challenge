class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :logo
      t.string :yelp_link

      t.timestamps null: false
    end
  end
end
