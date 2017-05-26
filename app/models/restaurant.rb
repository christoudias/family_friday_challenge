class Restaurant < ActiveRecord::Base

  validates_presence_of :name


  has_many :correspondences


  # average rating of votes for this restaurant. 
  def rating
    arr = self.correspondences.where("rating is not null").collect{|c| c.rating}
    (arr.size > 0) ? (arr.sum.to_f / arr.size.to_f ).round(2) : 0
  end

end
