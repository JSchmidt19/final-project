class CalculatorController < ApplicationController
    
    before_filter :set_style
    
    def set_style 
    if (session[:style] == "1")
        render layout: "calc_plain"
     else 
        render layout: "application"
    end
    end
    
  def index
  end

  def about
  end
end
