class SessionsController < ApplicationController
  include Clearance::App::Controllers::SessionsController
  sessions['id'] = User.find_by_email(params[:email])
end
