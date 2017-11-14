class PotsController < ApplicationController
    

    
  before_action :set_pot, only: [:show, :edit, :update, :destroy]
    
     
    
   layout :resolve_layout

  # GET /pots
  # GET /pots.json
  def index
    @pots = Pot.all
      @imageList = Hash.new
      @pots.each do |pot|
          @imageList[pot.id] = PotImage.where(pot_id: pot.pot_id).take
      end
          
  end

  # GET /pots/1
  # GET /pots/1.json
  def show
      @imageList = PotImage.where(pot_id: @pot.pot_id)
  end

  # GET /pots/new
  def new
    @pot = Pot.new
  end

  # GET /pots/1/edit
  def edit
  end

  # POST /pots
  # POST /pots.json
  def create
    @pot = Pot.new(pot_params)

    respond_to do |format|
      if @pot.save
        format.html { redirect_to @pot, notice: 'Pot was successfully created.' }
        format.json { render :show, status: :created, location: @pot }
      else
        format.html { render :new }
        format.json { render json: @pot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pots/1
  # PATCH/PUT /pots/1.json
  def update
    respond_to do |format|
      if @pot.update(pot_params)
        format.html { redirect_to @pot, notice: 'Pot was successfully updated.' }
        format.json { render :show, status: :ok, location: @pot }
      else
        format.html { render :edit }
        format.json { render json: @pot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pots/1
  # DELETE /pots/1.json
  def destroy
    @pot.destroy
    respond_to do |format|
      format.html { redirect_to pots_url, notice: 'Pot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pot
      @pot = Pot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pot_params
      params.require(:pot).permit(:pot_id, :title, :description, :price, :size, :color, :style, :glazes)
        params.require(:style)
    end
    
    def resolve_layout
    if (session[:style] == "1")
        return "main_plain"
     elsif(session[:style] == "2")
        return  "main_water"
     elsif(session[:style] == "3")
         return "main_fire"
     elsif(session[:style] == "4")
         return "main_forest"
     elsif(session[:style] == "5")
        return  "main_celestial"
     elsif(session[:style] == "6")
        return  "main_ice"
     elsif(session[:style] == "7")
        return  "main_desert"
     elsif(session[:style] == "8")
        return  "main_sunset"
     elsif(session[:style] == "9")
        return  "main_steam"
     elsif(session[:style] == "10")
        return  "main_dark"
     elsif(session[:style] == "11")
        return  "main_crystal"
     elsif(session[:style] == "12")
        return  "main_scp"
     elsif(session[:style] == "22")
         return "main_personal"
     else 
        return  "main_plain"
    end
  end
end
