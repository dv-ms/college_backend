class UserController < ApplicationController

    before_action :to_root, if: -> {user_signed_in?}
    protect_from_forgery with: :null_session

    def new
        @user = User.new
    end   

    def login
        @user = User.new
    end

    def upload_any_image
    end

    def tweet_screen

    end

    def tweet
        tweet = params[:tweet]
        result = UserTweet.new(tweet).execute

        if result.success?
            puts result.client.name
            puts result.tweet
            redirect_to user_tweet_path
        else
        end
    end

    private
    def to_root
        redirect_to root_path
    end
end
