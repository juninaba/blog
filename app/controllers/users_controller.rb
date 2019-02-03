class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).order("created_at DESC").page(params[:page]).per(4).search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(5).order("created_at DESC")
  end

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
