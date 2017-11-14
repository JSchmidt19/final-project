class CalculatorController < ApplicationController
    layout :resolve_layout
   
    
    
   

    
  def index
      @demo = [1,2,3,4,56,76,78]
  end
    
  def new
    @result = base(0, params[:a].to_i(), params[:b].to_i(), 0)
    render action: "index"
  end

  def about
  end
    
    def base(number, basefrom, baseto, alphabet)
        return number + basefrom + baseto + alphabet
  end
  helper_method :base
    
    
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
    
end
