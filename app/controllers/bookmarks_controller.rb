class BookmarksController < ApplicationController

  # def index
  #   @bookmarks = Bookmark.all
  # end

  def new
    @list = List.find(params[:list_id])

    @bookmark = Bookmark.new
  end

  def edit
    @list = List.find(params[:id])
    @bookmark = Bookmark.new(movie_params)
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(movie_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def movie_params
    # params.require(:movie).permit(:title)
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
