class StatusesController < ApplicationController
  layout "rocket"
  before_filter :authenticate

  def index
    params[:page] ||= 1
    unless current_user.tw_client.nil?
      #@tweets = current_user.tw_client.friends_timeline(:page => params[:page])
      user = User.find(9)
      @tweets = Status.tw_read(user, current_user.tw_client)
      #puts "@tweets.length is: " + @tweets.length.to_s
      #puts "@tweets[1] is:"
      #pp @tweets[1]
      #puts "@tweets[1].status_id ="
      #pp @tweets[1].status_id
      #puts "@tweets[1].status_user_name = " + @tweets[1].status_user_name
      #puts "@tweets[1].status_created_at = "
      #pp @tweets[1].status_created_at
      #pp Time.parse(@tweets[1].status_created_at)
      #puts "tweets[1][:status_user_id] is:"
      #pp @tweets[1][:status_user_id]
      #puts "tweets[1]['id'] is:"
      #pp @tweets[1]["id"]
    end
    @tweets[1]
  end

  def show
    unless current_user.tw_client.nil?
      @tweet = current_user.tw_client.status(params[:id])
    end
  end

  def mentions
    params[:page] ||= 1
    unless current_user.tw_client.nil?
      @mentions = current_user.tw_client.replies(:page => params[:page])
    end
  end

  def favorites
    params[:page] ||= 1
    unless current_user.tw_client.nil?
      @favorites = current_user.tw_client.favorites(:page => params[:page])
    end
  end

  def create
    options = {}

    unless params[:in_reply_to_status_id].blank?
      options.merge!({:in_reply_to_status_id => params[:in_reply_to_status_id]})
    end

    tweet = current_user.tw_client.update(params[:text], options)
    flash[:notice] = "Got it! Tweet ##{tweet.id} created."
    return_to_or root_url
  end

  def fav
    flash[:notice] = "Tweet fav'd. May not show up right away due to API latency."
    current_user.tw_client.favorite_create(params[:id])
    return_to_or root_url
  end

  def unfav
    flash[:notice] = "Tweet unfav'd. May not show up right away due to API latency."
    current_user.tw_client.favorite_destroy(params[:id])
    return_to_or root_url
  end

  # GET /statuses
  # GET /statuses.xml
#  def index
#    @statuses = Status.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @statuses }
#    end
#  end

  # GET /statuses/1
  # GET /statuses/1.xml
# def show
#   @status = Status.find(params[:id])

#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @status }
#    end
#  end

  # GET /statuses/new
  # GET /statuses/new.xml
  def new
    @status = Status.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @status }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  # POST /statuses
  # POST /statuses.xml
#  def create
#    @status = Status.new(params[:status])
#
#    respond_to do |format|
#      if @status.save
#        flash[:notice] = 'Status was successfully created.'
#        format.html { redirect_to(@status) }
#        format.xml  { render :xml => @status, :status => :created, :location => @status }
#      else
#       format.html { render :action => "new" }
#        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

  # PUT /statuses/1
  # PUT /statuses/1.xml
  def update
    @status = Status.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status])
        flash[:notice] = 'Status was successfully updated.'
        format.html { redirect_to(@status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.xml
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to(statuses_url) }
      format.xml  { head :ok }
    end
  end
end
