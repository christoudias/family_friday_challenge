class Vote < ActiveRecord::Base

  belongs_to :correspondence
  belongs_to :restaurant

end
