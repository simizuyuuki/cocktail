class UsersController < ApplicationController
  before_action :authenticate_user! 
  def show
    @nickname = current_user.nickname
    @tweets = current_user.tweets
  end
end