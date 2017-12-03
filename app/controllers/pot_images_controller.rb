class PotImagesController < ApplicationController
  before_action :set_pot_image, only: [:show, :edit, :update, :destroy]
    before_action :admin_user, only: [:destroy, :new, :edit, :create, :update, :index, :show]
    layout :resolve_layout

  # GET /pot_images
  # GET /pot_images.json
  def index
      if !params[:style]
            redirect_to "/pot_images/1"
        end
      
      
    @pot_images = PotImage.all
  end

  # GET /pot_images/1
  # GET /pot_images/1.json
  def show
  end

  # GET /pot_images/new
  def new
    @pot_image = PotImage.new
  end
    
    def add
    @pot_image = PotImage.new("pot_id" => params[:id])
  end

  # GET /pot_images/1/edit
  def edit
  end

  # POST /pot_images
  # POST /pot_images.json
  def create
    @pot_image = PotImage.new(pot_image_params)

    respond_to do |format|
      if @pot_image.save
        format.html { redirect_to "/pot_images/#{session[:style]}"}
        format.json { render :show, status: :created, location: @pot_image }
      else
        format.html { render :new }
        format.json { render json: @pot_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pot_images/1
  # PATCH/PUT /pot_images/1.json
  def update
    respond_to do |format|
      if @pot_image.update(pot_image_params)
        format.html { redirect_to "/pot_images/#{session[:style]}" }
        format.json { render :show, status: :ok, location: @pot_image }
      else
        format.html { render :edit }
        format.json { render json: @pot_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pot_images/1
  # DELETE /pot_images/1.json
  def destroy
    @pot_image.destroy
    respond_to do |format|
      format.html { redirect_to "/pot_images/#{session[:style]}"}
      format.json { head :no_content }
    end
  end

  private
    
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
    def admin_user
      redirect_to(root_url) unless User.find_by(id: session[:user_id]) && User.find_by(id: session[:user_id]).admin?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_pot_image
      @pot_image = PotImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pot_image_params
      params.require(:pot_image).permit(:pot_id, :image_url)
    end
end
