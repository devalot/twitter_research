class CategoriesController < ApplicationController

  ##############################################################################
  # Show a list of all categories.
  def index
    @categories = Category.order(:title).limit(50)
    respond_with(@categories)
  end

  ##############################################################################
  # Show a single category with all its tweets.
  def show
    @category = Category.includes(:tweets).
      order('tweets.tweeted_at desc').find(params[:id])
    respond_with(@category)
  end

  ##############################################################################
  # Show a form for a new Category.
  def new
    @category = Category.new

    respond_with(@category) do |format|
      format.js {render(partial: 'form', content_type: "text/html")}
    end
  end

  ##############################################################################
  # Actually create the category.
  def create
    @category = Category.create(params[:category])

    respond_with(@category, location: categories_url) do |format|
      format.js {render(partial: 'category',
          object: @category, content_type: "text/html")}
    end
  end

  ##############################################################################
  # Show a form to let a user edit a category.
  def edit
    @category = Category.find(params[:id])
    respond_with(@category)
  end

  ##############################################################################
  # Update the category after the edit form is submitted.
  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    respond_with(@category, location: categories_url)
  end

  ##############################################################################
  # Delete a category
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_with(@category) do |format|
      format.js {render(:nothing => true)}
    end
  end
end
