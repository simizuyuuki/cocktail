class LikesController < ApplicationController
  before_action :set_tweet

  def create
    like = current_user.likes.build(tweet_id: params[:tweet_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end