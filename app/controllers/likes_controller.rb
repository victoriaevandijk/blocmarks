class LikesController < ApplicationController
   @bookmark = Bookmark.find(params[:bookmark_id])
   like = current_user.likes.build(bookmark: @bookmark)
   
     if like.save
       redirect_to @bookmark.topic
     else
       redirect_to @bookmark.topic
     end
   end

   def destroy
      like = Like.find(params[:id])
      @bookmark = Bookmark.find(params[:bookmark_id])
 
     if like.destroy
       redirect_to @bookmark.topic
     else
       redirect_to @bookmark.topic
     end
end
