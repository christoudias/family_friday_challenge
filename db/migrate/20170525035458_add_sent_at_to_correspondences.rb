class AddSentAtToCorrespondences < ActiveRecord::Migration
  def change
    add_column :correspondences, :sent_at, :datetime
  end
end
