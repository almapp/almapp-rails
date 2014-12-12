class PlacesController < ApplicationController
  before_filter :determine_scope
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :set_map_hash, only: [:show, :edit]

  # GET /places
  # GET /places.json
  def index
    @places = @scope.all
  end

  def maps
    @hash = create_map_hash(Place.first) #TODO HERE
    @places = @scope.all
  end

  def create_map_hash(input)
    array = input.kind_of?(Array) ? input : [input]
    hash = Gmaps4rails.build_markers(array) do |place, marker|
      marker.infowindow render_to_string(:partial => 'places/infowindow', :locals => { :place => place})
      marker.lat place.latitude
      marker.lng place.longitude
      marker.title place.name
      marker.json({:id => place.id, :name => place.name })
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show

  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to place_path(@place), notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to place_path(@place), notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
    def determine_scope
      if params[:camp_id]
        @camp = Camp.find(params[:camp_id])
        @scope = @camp.places
      else
        @scope = current_organization.places
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    def set_map_hash
      @hash = create_map_hash(@place)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:pid, :name, :faculty_id, :camp_id, :coords, :floor, :icon, :description, :zoom, :angle, :tilt)
    end
end
