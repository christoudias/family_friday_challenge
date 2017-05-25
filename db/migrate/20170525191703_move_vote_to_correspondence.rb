class MoveVoteToCorrespondence < ActiveRecord::Migration
  def change
    drop_table :votes
    add_column :correspondences, :rating, :integer, :after => :token
  end
end
