class RocketController < ApplicationController

  def index
    redirect_to :action => "login"
  end

  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to :action => "status"
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to :action => "login"
  end

  def status
    
  end
end
