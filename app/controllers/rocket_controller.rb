class RocketController < ApplicationController

  layout "rocket"
  def index
    if request.post? && session[:user_id] == nil
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to :controller => "statuses", :action => "index"
        # redirect_to :action => "index"
      else
        flash.now[:notice] = "Invalid email/password combination"
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
