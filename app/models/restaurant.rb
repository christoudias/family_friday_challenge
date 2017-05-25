class Restaurant < ActiveRecord::Base

  has_many :correspondences
  has_many :votes

end
