class PotsController < ApplicationController
    

    
  before_action :set_pot, only: [:show, :edit, :update, :destroy]
    before_action :admin_user, only: [:destroy, :new, :edit, :create, :update]
 layout :resolve_layout

    
    def buy
        if params[:id]
            @pot = Pot.find(params[:id])
            
            @image = PotImage.where(pot_id: params[:id]).take
            
        else
            @pot = ""
        end
    end
    
    
  # GET /pots
  # GET /pots.json
  def index
      
    @pots = Pot.paginate(page: params[:page], :per_page => 20).order('id DESC')
      @imageList = Hash.new
      @pots.each do |pot|
          @imageList[pot.id] = PotImage.where(pot_id: pot.id).take
          if @imageList[pot.id] == nil
              @imageList[pot.id] = PotImage.take
          end
      end
      

          
  end
    
    def search 
        
        @all = Pot.all
        @pots = []
      @imageList = Hash.new
      @all.each do |pot|
          
          if (check_pot(pot))
              @pots.push(pot)
              @imageList[pot.id] = PotImage.where(pot_id: pot.id).take
              if @imageList[pot.id] == nil
                  @imageList[pot.id] = PotImage.take
              end
          end
      end
        @pots = @pots.reverse.paginate(page: params[:page], :per_page => 20)
        render action: "index"
    end

  # GET /pots/1
  # GET /pots/1.json
  def show
      @imageList = PotImage.where(pot_id: @pot.id)
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
        format.html { redirect_to "/pots/#{session[:style]}"}
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
        format.html { redirect_to "/pots/#{session[:style]}" }
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
      format.html { redirect_to "/pots/#{session[:style]}" }
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
      params.require(:pot).permit(:pot_id, :title, :description, :price, :size, :color, :style, :glazes, pot_image_attributes: [:image])
    end
        
        
    def check_pot(pot)
        
        if (params[:minprice] != "")
            if pot.price.to_f < params[:minprice].to_f
                return false
            end
        end
        if (params[:maxprice] != "")
            if pot.price.to_f > params[:maxprice].to_f
                return false
            end
        end
        if (params[:size] != "")
            if !pot.size.include? params[:size]
                return false
            end
        end
        if (params[:color] != "")
            if !pot.color.include? params[:color]
                return false
            end
        end
        if (params[:tech] != "")
            if !pot.style.include? params[:tech]
                return false
            end
        end
        if (params[:glaze] != "")
            if !pot.glazes.include? params[:glaze]
                return false
            end
        end
        if (params[:title] != "")
            if !pot.title.include? params[:title]
                return false
            end
        end
        if (params[:desc] != "")
            if !pot.description.include? params[:desc]
                return false
            end
        end
        
        
        return true
    end
    
    def admin_user
      redirect_to(root_url) unless User.find_by(id: session[:user_id]) && User.find_by(id: session[:user_id]).admin?
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
