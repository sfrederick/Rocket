class Status < ActiveRecord::Base
  require 'json/add/rails'
  require 'PP'

  #attr_reader :status_text, :status_id, :status_created_at
  #attr_reader :user_name, :user_image_url, :user_id
  #attr_reader :reply_status_id
  
  def self.tw_read(tw_client)
    last_tweet = find_last_by_network("twitter")
    last_tweet_id = last_tweet.nil? ? -1 : last_tweet[:status_id]
    #tweets = []
    #tweets << tw_get_new(tw_client, last_tweet_id)
    tw_get_new(tw_client, last_tweet_id)
    find_all_by_network("twitter", :limit => 20, :order => "status_created_at DESC")
    #saved_status.each do |a_status|
      #puts "json out of db a_tweet is"
      #a_tweet = JSON.parse(a_status.status_json)
      #pp a_tweet
      #pp a_status.user_json
      #a_tweet[:user] = JSON.parse(a_status.user_json)
      #pp a_tweet
      #tweets << a_status
    #end
    #tweets
  end

  private
  def self.tw_get_new(tw_client, last_tw_id)

    unless tw_client.nil?
      tw_status = Status.new
      if (last_tw_id > 0)
        new_tweets = tw_client.friends_timeline(:since_id => last_tw_id)
      else
        new_tweets = tw_client.friends_timeline()
      end
      new_tweets.each do |a_tweet|
        tw_status.network = "twitter"
        tw_status.status_created_at = a_tweet[:created_at]
        tw_status.status_text = a_tweet[:text]
        tw_status.status_id = a_tweet[:id]
        tw_status.status_favorited = a_tweet[:favorited]
        tw_status.user_id = a_tweet[:user][:id]
        tw_status.user_name = a_tweet[:user][:screen_name]
        tw_status.user_image_url = a_tweet[:user][:profile_image_url]
        tw_status.reply_status_id = a_tweet[:in_reply_to_status_id]
        #puts "raw json is a_tweet.user"
        #pp a_tweet.user
        tw_status.user_json = JSON.generate(a_tweet[:user])
        a_tweet.delete("user")

        #puts "raw json is a_tweet"
        #pp a_tweet
        tw_status.status_json = JSON.generate(a_tweet)
        tw_status.save
      end
    end
  end
end
