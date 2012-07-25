class TweetsController < ApplicationController

  def index
    @tweets = current_user.tweets.order('tweeted_at desc').limit(25)
    respond_with(@tweets)
  end

  def show
    @tweet = current_user.tweets.with_notes.find(params[:id])
    respond_with(@tweet)
  end

  def create
    @tweet = current_user.tweets.create(params[:tweet])
    respond_with(@tweet, :location => tweets_url)
  end
end
