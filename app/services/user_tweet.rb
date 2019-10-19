require 'twitter'
class UserTweet
    

    def initialize(tweet)
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV["TWITTER_APP_API_KEY"]
            config.consumer_secret     = ENV["TWITTER_APP_CLIENT_SECRET"]
            config.access_token        = ENV["TWITTER_APP_MANAV_ACCESS_TOKEN"]
            config.access_token_secret = ENV["TWITTER_APP_MANAV_ACCESS_KEY"]
          end
        @tweet = tweet
    end

    def execute
        puts @client
        @client.update(@tweet)
        return OpenStruct.new(success?: true, client: @client, tweet: @tweet)        
    end
end