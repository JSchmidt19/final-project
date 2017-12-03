module SessionsHelper
    
    # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
    
    def admin?
        !!session[:user_id_admin]
    end
        
    def log_out
    session.delete(:user_id)
        session.delete(:user_id_admin)
        session.delete(:answers)
        session.delete(:fractal)
    @current_user = nil
  end
    
    def current_user?(user)
    user == current_user
  end
    # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
    
    def answers_are_correct
        if (session[:answers].length != session[:fractal].length - 1 || session[:answers].length < 8)
            return false
        end
        expectedAnswers = []
        
        
        for k in 0...8
            answers = []
            value = 0
            for i in 0...22
                for j in ((k / 2) * 2)...((k / 2) * 2 + 2)
                    if session[:fractal][k][i][j] == value
                        answers << i
                    elsif session[:fractal][k][i][j] > value
                        answers = [i]
                        value = session[:fractal][k][i][j]
                    end 
                end
            end
            expectedAnswers << answers
        end
        
        #demo algorithm
=begin
        
        for k in 0...8
            answers = []
            value = 0
            for i in 0...22
                for j in ((k / 2) * 2)...((k / 2) * 2 + 2)
                    if session[:fractal][k][i][j] == value
                        answers << i
                    elsif session[:fractal][k][i][j] > value
                        answers = [i]
                        value = session[:fractal][k][i][j]
                    end 
                end
            end
            expectedAnswers << answers
        end
=end
        
            
        
            
            
            
            
        return valid_answer(session[:answers], expectedAnswers)
    end
    
    
    def valid_answer(given, expected)
        for i in 0...expected.length
            if !expected[i].include? given[i].to_i
                return false
            end
        end
        return true
    end
    
    def expected_answers
        if (session[:answers].length != session[:fractal].length - 1)
            return false
        end
        expectedAnswers = []
        
        count = 8
        if session[:fractal].length <= 8
            count = session[:fractal].length
        end
        
        
        for k in 0...count
            answers = []
            value = 0
            for i in 0...22
                for j in ((k / 2) * 2)...((k / 2) * 2 + 2)
                    if session[:fractal][k][i][j] == value
                        answers << i
                    elsif session[:fractal][k][i][j] > value
                        answers = [i]
                        value = session[:fractal][k][i][j]
                    end 
                end
            end
            expectedAnswers << answers
        end
        expectedAnswers
    end
        
end
