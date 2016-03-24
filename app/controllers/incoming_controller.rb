class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    # You put the message-splitting and business
    # magic here.
     # Find the user by using params[:sender]
     raise params.inspect
     @user = User.find_by(email: params[:sender])
    
     # Find the topic by using params[:subject]
     @topic = Topic.find_by(title: params[:subject])
    
     # Assign the url to a variable after retreiving it from params["body-plain"]
     @url = params["body-plain"]
    
     # Check if user is nil, if so, create and save a new user
     if @user == nil
       @user = User.new
       @user.email = params[:sender]
       @user.password = 'password'
       @user.save!
     end
    
     # Check if the topic is nil, if so, create and save a new topic
     if @topic == nil
       @topic = Topic.new
       @topic.user_id = @user.id
       @topic.title = params[:subject]
       @topic.save!
     end
    
     # Now that you're sure you have a valid user and topic, build and save a new bookmark
     @bookmark = Bookmark.new
     @bookmark.topic_id = @topic.id
     @bookmark.url = @url.strip
     @bookmark.save!
    
    # Assuming all went well.
    head 200
  end
end