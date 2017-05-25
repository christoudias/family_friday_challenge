class CreateCorrespondences < ActiveRecord::Migration
  def change
    create_table :correspondences do |t|
      t.string :email
      t.string :name
      t.string :team
      t.integer :restaurant_id
      t.string :token

      t.timestamps null: false
    end
  end
end
