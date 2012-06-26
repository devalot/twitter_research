
class SearchesController < ApplicationController

  def index
  end

  def show
    searcher = SimpleTwitter::Search.new
    @results = searcher.search(params[:q])
  end

end
