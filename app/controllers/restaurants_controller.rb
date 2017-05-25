class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    # render :json => @restaurants and return
  end

end
