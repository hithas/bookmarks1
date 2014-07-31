class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find_by(id: params[:id])
    @user = User.find_by(id: @bookmark.user_id)
  end

  def new
    @users = User.all
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.name = params[:name]
    @bookmark.url = params[:url]
    @bookmark.desc = params[:desc]
    @bookmark.user_id = User.find_by(name: params[:user_name]).id


    if @bookmark.save
      redirect_to "/bookmarks/#{ @bookmark.id }"
    else
      render 'new'
    end
  end

  def edit
    @bookmark = Bookmark.find_by(id: params[:id])
    @users = User.all
  end

  def update
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.name = params[:name]
    @bookmark.url = params[:url]
    @bookmark.desc = params[:desc]
    #user = User.find_by(name: params[:user_name])
    #@bookmark.user_id = user.id
    

    if @bookmark.save
      redirect_to "/bookmarks/#{ @bookmark.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.destroy


    redirect_to "/bookmarks"
  end
end
