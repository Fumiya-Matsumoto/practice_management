class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id).order("practice_day DESC")
    @days = ["日", "月", "火", "水", "木", "金", "土"]
  end

  def main
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id).order("practice_day DESC")
    @days = ["日", "月", "火", "水", "木", "金", "土"]
  end
end
