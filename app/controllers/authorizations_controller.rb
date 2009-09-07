class AuthorizationsController < ApplicationController
  def new
    tw_oauth = current_user.tw_oauth
    session['rtoken'] = tw_oauth.request_token.token
    session['rsecret'] = tw_oauth.request_token.secret
    redirect_to tw_oauth.request_token.authorize_url
  end
  
  def show
    tw_oauth = current_user.tw_oauth
    tw_oauth.authorize_from_request(session['rtoken'], session['rsecret'])
    
    session['rtoken'] = nil
    session['rsecret'] = nil
    
    current_user.update_attributes({
      :atoken => tw_oauth.access_token.token,
      :asecret => tw_oauth.access_token.secret,
    })
    
    redirect_to root_path
  end
end
