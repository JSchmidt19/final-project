class MainController < ApplicationController
   layout :resolve_layout
    

    
  def root
      if session.has_key?(:visited_before)
            redirect_to "/index/#{session[:style]}"
        else
          session[:visited_before] = true
            redirect_to "/index/1"
        end
      
    end
    
  def index
      session[:style] = params[:style]
  end

  def about
      session[:style] = params[:style]
  end

  def contact
      session[:style] = params[:style]
  end

  def login
      session[:style] = params[:style]
  end
    
    private 
    def resolve_layout
    session[:style] = params[:style]
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
