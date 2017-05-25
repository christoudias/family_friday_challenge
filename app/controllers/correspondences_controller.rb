class CorrespondencesController < ApplicationController
  before_action :set_correspondence, only: [:show, :edit, :update, :destroy]

  # GET /correspondences
  # GET /correspondences.json
  def index
    @correspondences = Correspondence.all
  end

  # GET /correspondences/1
  # GET /correspondences/1.json
  def show
  end

  # GET /correspondences/new
  def new
    @correspondence = Correspondence.new
  end

  # GET /correspondences/1/edit
  def edit
  end

  # POST /correspondences
  # POST /correspondences.json
  def create
    if params[:input]
      data = Correspondence.new.input_valid?(params[:input])
      if data
        restaurant = Restaurant.find_by_name(data["restaurant"]["name"])
        if !restaurant
          restaurant = Restaurant.new(data["restaurant"])
          if !restaurant.save
            flash[:error] = "Error saving restaurant. Please make sure all fields are present."
          end
        end


        successful_import = []
        failed_import = []
        data["members"].each do |member|
          corr = restaurant.correspondences.build(member)
          if corr.save
            successful_import << member.to_s
          else
            failed_import << member.to_s
          end
        end
        if successful_import.size > 0
          flash[:success] = "#{successful_import.size} #{"record".pluralize(successful_import.size)} imported successfully."
        end
        if failed_import.size > 0
          flash[:error] = "#{failed_import.size} #{"record".pluralize(failed_import.size)} failed to import: <br>#{failed_import.join("<br>")}"
        end

      else
        flash[:error] = "Please enter valid JSON with all required fields."
      end
    end

    render 'new'


    # render :json => params and return
    # @correspondence = Correspondence.new(correspondence_params)
    #
    # respond_to do |format|
    #   if @correspondence.save
    #     format.html { redirect_to @correspondence, notice: 'Correspondence was successfully created.' }
    #     format.json { render :show, status: :created, location: @correspondence }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @correspondence.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /correspondences/1
  # PATCH/PUT /correspondences/1.json
  def update
    respond_to do |format|
      if @correspondence.update(correspondence_params)
        format.html { redirect_to @correspondence, notice: 'Correspondence was successfully updated.' }
        format.json { render :show, status: :ok, location: @correspondence }
      else
        format.html { render :edit }
        format.json { render json: @correspondence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /correspondences/1
  # DELETE /correspondences/1.json
  def destroy
    @correspondence.destroy
    respond_to do |format|
      format.html { redirect_to correspondences_url, flash[:success] = 'Correspondence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_correspondence
      @correspondence = Correspondence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def correspondence_params
      params.require(:correspondence).permit(:email, :name, :team, :restaurant_id, :token)
    end
end
