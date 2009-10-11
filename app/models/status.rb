class Status < ActiveRecord::Base
  require 'json/add/rails'
  require 'PP'

  composed_of :user
  
  def self.tw_read(tw_client)
    last_tweet = find_last_by_network("twitter")
    last_tweet_id = last_tweet.nil? ? -1 : last_tweet.status_id
    tweets = []
    tweets << tw_get_more(tw_client, last_tweet_id)
    saved_tweets = []
    saved_tweets = find_all_by_network("twitter", :limit => 20, :order => "status_at DESC")
    saved_tweets.each do |a_status|
      #puts "json out of db a_tweet is"
      a_tweet = JSON.parse(a_status.status_json)
      #pp a_tweet
      #pp a_status.user_json
      a_tweet[:user] = JSON.parse(a_status.user_json)
      #pp a_tweet
      tweets << a_tweet
    end
    tweets
  end

  private
  def self.tw_get_more(tw_client, last_tw_id)

    unless tw_client.nil?
      tw_status = Status.new
      #new_tweets = []
      if (last_tw_id > 0)
        new_tweets = tw_client.friends_timeline(:since_id => last_tw_id)
      else
        new_tweets = tw_client.friends_timeline()
      end
      new_tweets.each do |a_tweet|
        tw_status.network = "twitter"
        tw_status.status_at = a_tweet.created_at
        tw_status.status_text = a_tweet[:text]
        tw_status.status_id = a_tweet[:id]
        tw_status.user_id = a_tweet[:user][:id]
        tw_status.user_name = a_tweet[:user][:screen_name]
        puts "raw json is a_tweet.user"
        pp a_tweet.user
        tw_status.user_json = JSON.generate(a_tweet.user)
        a_tweet.delete("user")

        puts "raw json is a_tweet"
        pp a_tweet
        tw_status.status_json = JSON.generate(a_tweet)
        tw_status.save
      end
    end
    new_tweets
  end
end
