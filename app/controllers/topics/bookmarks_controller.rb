class Topics::BookmarksController < ApplicationController

  def show
    @topic.find(params[:topic_id])
    @bookmarks = @topic.bookmarks
    authorize @bookmarks
  end

  def new
    #@topic = Topic.find(params[:id])
    @bookmark = Bookmark.new
  end
  
  def create
    #@topic = Topic.find(params[:id])
     @topic = Topic.find(params[:topic_id])
     @bookmark = Bookmark.new(params.require(:bookmark).permit(:url, :user))
     @bookmark.topic = @topic
     @bookmark.user = current_user
     if @bookmark.save
       flash[:notice] = "Bookmark saved!"
       redirect_to @topic
     else
       flash[:error] = "Error creating bookmark. Please try again."
       render :new
     end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.save
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    
    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      flash[:notice] = "Bookmark was updated."
      redirect_to [@topic]
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :edit
    end
  end
  
  def destroy
     @bookmark = Bookmark.find(params[:id])
 
     if @bookmark.destroy
       flash[:notice] = "Bookmark was deleted successfully."
       redirect_to topics_path
     else
       flash[:error] = "There was an error deleting the bookmark."
       render :show
     end
  end
end