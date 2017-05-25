class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    # render :json => @restaurants and return
  end

  def rate
    # render :text => (Integer(params[:rating]) rescue nil) and return
    if params[:token] and params[:rating] and (Integer(params[:rating]) rescue nil)
      @correspondence = Correspondence.find_by_token(params[:token])
      if @correspondence and params[:rating].to_i > 0 and params[:rating].to_i <=5
        @correspondence.rating = params[:rating]
        if @correspondence.save
        else # error saving
        end
      else
        render :text => "Invalid Request...." and return
      end
    else
      render :text => "Invalid Request." and return
    end
  end

end
