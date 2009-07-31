class RocketController < ApplicationController

  def index
    if request.post? && session[:user_id] == nil
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        # redirect_to :controller => "status", :action => "list"
        redirect_to :action => "index"
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end

  def status
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to :action => "index"
  end

end
