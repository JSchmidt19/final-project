class MainController < ApplicationController
    
   before_filter :set_style
    
    def set_style 
    if (session[:style] == "1")
        render layout: "main_plain"
     else 
        render layout: "application"
    end
    end
    
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
end
