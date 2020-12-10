class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

end