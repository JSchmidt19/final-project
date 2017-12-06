class SessionsController < ApplicationController
layout "loginstuff"
  def new
  end
    
    def second
    end

    def create
  user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
        redirect_back_or user
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
    end
    
    def loginsecondary
        authorized_user = User.authenticateSecondary(params[:name],params[:login_password])
    if logged_in? && current_user.admin? && session[:answers] && answers_are_correct && authorized_user
        session[:answers] = []
        session[:fractal] = []
        session[:user_id_admin] = authorized_user.id
      redirect_to root_url
    else

      render 'secondlogin'
    end
    end

  def destroy
    log_out
    redirect_to root_url
  end
    
    def fractal
        if !params[:picked]
            session[:fractal] = []
            session[:answers] = []
        else 
            session[:answers] << params[:picked]
        end
        
        
      @individual = (session[:answers].length % 10) + 1 ;
        
      @strings = []
      File.open("/home/codio/workspace/depot/app/assets/images/testtext.txt").each do |line|
        @strings.append(line)
      end
        
        @dataline = []
        
        @data = []
        
        for i in 0...22
            @dataline << [Random.rand(101), 
                Random.rand(101), 
                Random.rand(101),
                Random.rand(101),
                Random.rand(101),
                Random.rand(101),
                Random.rand(101),
                Random.rand(101),
                @strings[Random.rand(@strings.length)]]
            
            
            @data << @dataline[i][0].to_s + " | " +
                @dataline[i][1].to_s + " | " +
                @dataline[i][2].to_s + " | " +
                @dataline[i][3].to_s + " | " +
                @dataline[i][4].to_s + " | " +
                @dataline[i][5].to_s + " | " +
                @dataline[i][6].to_s + " | " +
                @dataline[i][7].to_s + " | " + "<br>" +
                @dataline[i][8]
        end
        
        session[:fractal] << @dataline
        
        
    end
    
    
end
