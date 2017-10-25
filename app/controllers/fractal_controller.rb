class FractalController < ApplicationController
  def index
      @index = "hi"
      #@data = File.read("/home/codio/workspace/depot/app/assets/images/Fractals/fractal1.txt")
      @data = []
      File.open("/home/codio/workspace/depot/app/assets/images/testtext.txt").each do |line|
        @data.append(line)
      end
      
      
      
      if params[:individual] != nil 
          @individual = params[:individual]
          
      else
          @individual = "fractal1";
      end
      @fractal = []
      File.open("/home/codio/workspace/depot/app/assets/images/Fractals/" + @individual + ".txt").each do |line|
        @fractal.append(line)
      end
      
  end

  def login
  end
end
