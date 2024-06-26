class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy, :show]
before_action :move_to_index, except: [:index, :show, :search, :destroy, :update, :create, :new]
  before_action :authenticate_user!, only: [ :create, :edit, :update, :destroy]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  def edit
 
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user) 
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text, :recipe, ).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def check_owner
    unless @tweet.user == current_user
      redirect_to root_path, alert: "You are not authorized for this action."
    end
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @tweet.user_id
      redirect_to action: :index
    end
  end
end