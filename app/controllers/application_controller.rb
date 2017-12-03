class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    include SessionsHelper
    before_filter :set_default_style

    def set_default_style
        if session.has_key?(:visited_before)
            
        else
          session[:visited_before] = true
            params[:style] = 1
            session[:style] = 1
        end
        session[:style] = params[:style]
        @style = session[:style]
        
         @url = request.original_url
        
        if @url.match(%r|/\d|)
            @url = request.original_url[0..(request.original_url =~ %r|/\d|)- 1]
        elsif @url =~ %r|/\d\d|
            @url = request.original_url[request.original_url =~ %r|/\d\d|..-2]
        else 
            @url = request.original_url[0..-2]
        end
    end
    
    def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
    
    def logged_in?
    !current_user.nil?
  end
    
end
