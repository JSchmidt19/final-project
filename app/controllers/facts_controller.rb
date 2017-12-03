class FactsController < ApplicationController
    before_action :set_fact, only: [:show, :edit, :update, :destroy]
    before_action :admin_user, only: [:destroy, :new, :edit, :create, :update]
layout :resolve_layout
  # GET /facts
  # GET /facts.json
  def index
      @facts = Fact.paginate(page: params[:page], :per_page => 20).order('id DESC')
  end
    
    def search 
        
        @all = Fact.all
        @facts = []
      @all.each do |fact|
          
          if (check_fact(fact))
              @facts.push(fact)
          end
      end
        @facts = @facts.reverse.paginate(page: params[:page], :per_page => 20)
        render action: "index"
    end

  # GET /facts/1
  # GET /facts/1.json
  def show
  end

  # GET /facts/new
  def new
    @fact = Fact.new
  end

  # GET /facts/1/edit
  def edit
  end

  # POST /facts
  # POST /facts.json
  def create
    @fact = Fact.new(fact_params)

    respond_to do |format|
      if @fact.save
        format.html { redirect_to "/facts/#{session[:style]}"}
        format.json { render :show, status: :created, location: @fact }
      else
        format.html { render :new }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facts/1
  # PATCH/PUT /facts/1.json
  def update
    respond_to do |format|
      if @fact.update(fact_params)
        format.html { redirect_to "/facts/#{session[:style]}"}
        format.json { render :show, status: :ok, location: @fact }
      else
        format.html { render :edit }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facts/1
  # DELETE /facts/1.json
  def destroy
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to "/facts/#{session[:style]}"}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fact
      @fact = Fact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fact_params
      params.require(:fact).permit(:title, :body, :fact_id)
    end
    
    def check_fact(fact)
        if (params[:art] == "1")
            if !(fact.fact_id % 2 == 0)
                return false
            end
        end
        
        if (params[:crime] == "1")
            if !(fact.fact_id % 3 == 0)
                return false
            end
        end
        
        if (params[:death] == "1")
            if !(fact.fact_id % 5 == 0)
                return false
            end
        end
        
        if (params[:entertainment] == "1")
            if !(fact.fact_id % 7 == 0)
                return false
            end
        end
        
        if (params[:history] == "1")
            if !(fact.fact_id % 11 == 0)
                return false
            end
        end
        
        if (params[:hoaxes] == "1")
            if !(fact.fact_id % 13 == 0)
                return false
            end
        end
        
        if (params[:humor] == "1")
            if !(fact.fact_id % 17 == 0)
                return false
            end
        end
        
        if (params[:language] == "1")
            if !(fact.fact_id % 19 == 0)
                return false
            end
        end
        
        if (params[:literature] == "1")
            if !(fact.fact_id % 23 == 0)
                return false
            end
        end
        
        if (params[:math] == "1")
            if !(fact.fact_id % 29 == 0)
                return false
            end
        end
        
        if (params[:music] == "1")
            if !(fact.fact_id % 31 == 0)
                return false
            end
        end
        
        if (params[:oddities] == "1")
            if !(fact.fact_id % 37 == 0)
                return false
            end
        end
        
        if (params[:poems] == "1")
            if !(fact.fact_id % 41 == 0)
                return false
            end
        end
        
        if (params[:puzzles] == "1")
            if !(fact.fact_id % 43 == 0)
                return false
            end
        end
        
        if (params[:quotations] == "1")
            if !(fact.fact_id % 47 == 0)
                return false
            end
        end
        
        if (params[:religion] == "1")
            if !(fact.fact_id % 53 == 0)
                return false
            end
        end
        
        if (params[:science] == "1")
            if !(fact.fact_id % 59 == 0)
                return false
            end
        end
        
        if (params[:society] == "1")
            if !(fact.fact_id % 61 == 0)
                return false
            end
        end
        
        if (params[:technology] == "1")
            if !(fact.fact_id % 67 == 0)
                return false
            end
        end
        
        if (params[:trivia] == "1")
            if !(fact.fact_id % 71 == 0)
                return false
            end
        end
        
        if (params[:favorites] == "1")
            if !(fact.fact_id % 73 == 0)
                return false
            end
        end
        
        if (params[:other] == "1")
            if !(fact.fact_id % 79 == 0)
                return false
            end
        end
        
        
        if (params[:title] != "")
            if !fact.title.include? params[:title]
                return false
            end
        end
        if (params[:desc] != "")
            if !fact.body.include? params[:desc]
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
