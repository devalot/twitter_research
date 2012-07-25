class NotesController < ApplicationController

  ##############################################################################
  before_filter(:fetch_tweet_and_maybe_note)

  ##############################################################################
  def index
    @notes = @tweet.notes.order('created_at desc')
    respond_with([@tweet, @notes], location: tweet_url(@tweet))
  end

  ##############################################################################
  def show
    respond_with([@tweet, @note], location: tweet_url(@tweet))
  end

  ##############################################################################
  def new
    @note = @tweet.notes.build
    respond_with([@tweet, @note])
  end

  ##############################################################################
  def create
    @note = @tweet.notes.create(params[:note])
    respond_with([@tweet, @note], location: tweet_url(@tweet))
  end

  ##############################################################################
  def edit
    respond_with([@tweet, @note])
  end

  ##############################################################################
  def update
    @note.update_attributes(params[:note])
    respond_with([@tweet, @note])
  end

  ##############################################################################
  def destroy
    @note.destroy
    respond_with([@tweet, @note])
  end

  ##############################################################################
  private

  ##############################################################################
  def fetch_tweet_and_maybe_note
    @tweet = current_user.tweets.find(params[:tweet_id])
    @note = @tweet.notes.find(params[:id]) if params[:id]
  end
end
