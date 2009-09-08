class UsersController < ApplicationController
  layout "rocket"
  #layout :decide_layout

  include Clearance::App::Controllers::UsersController

  def show
    @tweets = current_user.tw_client.user_timeline(:id => params[:id])
    @user = current_user.tw_client.user(params[:id])
  end

  #private
  #  def decide_layout
  #    %w(new create).include?(action_name) ? 'login' : 'application'
  #  end

  # GET /users
  # GET /users.xml
#  def index
#    @users = User.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @users }
#    end
#  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

   respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
#  def new
#    @user = User.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @user }
#    end
#  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
#  def create
#    @user = User.new(params[:user])

#    respond_to do |format|
#      if @user.save
#        flash[:notice] = 'User was successfully created.'
#        format.html { redirect_to(@user) }
#       format.xml  { render :xml => @user, :status => :created, :location => @user }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    success = true

    respond_to do |format|

      unless (username = params[:user][:username]).nil?
        if @user.username != username
          puts "updating username"
          success = @user.update_attribute(:username, username)
        end
      end
      
      unless !success || (tw_auth = params[:user][:tw_auth]).nil?
        if (@user.tw_auth != tw_auth)
          puts "updating tw_auth"
          success = @user.update_attribute(:tw_auth, tw_auth)
        end
      end

      unless !success || (fb_auth = params[:user][:fb_auth]).nil?
        if (@user.fb_auth != fb_auth)
          puts "updating fb_auth"
          success = @user.update_attribute(:fb_auth, fb_auth)
        end
      end

      unless !success || (email = params[:user][:email]).nil?
        if (@user.email != email)
          puts "updating email"
          success = @user.update_attribute(:email, email)
        end
      end

      unless !success || (password = params[:user][:password]).nil?
        if (@user.email != email)
          puts "updating password"
          success = @user.update_attribute(:password, password)
        end
      end

      if success
         flash[:notice] = 'User was successfully updated.'
         format.html { redirect_to(@user) }
         format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
