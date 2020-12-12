class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
  end
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'follower'
  end

end