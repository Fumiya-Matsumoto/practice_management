class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  def show
    @post = Post.find_by(id: params[:id])
    # @user = @post.user
  end
  def new
    @post = Post.new
  end
  def create
    if not params[:time_hour]
      params[:time_hour] = 0
    end
    if not params[:time_minute]
      params[:time_minute] = 0
    end
    if not params[:time_second]
      params[:time_second] = 0
    end
    params[:practice_day] = params[:post][:practice_day]
    post_params = params.require(:post).permit(:practice_timezone, :weather, :place, :kind_of_practice, :strength, :content, :practice_day, :distance, :time_hour, :time_minute, :time_second, :interval_type)
    if post_params[:kind_of_practice] == "インターバル" or post_params[:kind_of_practice] == "レペティション"
      post_params[:distance_m] = post_params[:distance]
      post_params[:distance] = post_params[:distance]/1000
    else
      post_params[:distance_m] = post_params[:distance]
    end
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.practice_day_year = @post.practice_day.year
    @post.practice_day_month = @post.practice_day.month
    @post.practice_day_day = @post.practice_day.day
    days = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]
    @post.practice_day_of_week = days[@post.practice_day.wday]
    @post.time_hour = @post.time_hour.to_i
    @post.time_minute = @post.time_minute.to_i
    @post.time_second = @post.time_second.to_i
    if post_params[:kind_of_practice] != "レスト"
      total_seconds = 3600 * @post.time_hour + 60 * @post.time_minute + @post.time_second
      pace = (total_seconds / @post.distance)
      pace_minute = pace.div(60)
      pace_second = pace % 60
      pace_undersecond = pace - pace.to_i
      @post.pace_minute = pace_minute
      @post.pace_second = pace_second
      @post.pace_undersecond = pace_undersecond
    end
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/users/#{current_user.id}/#{@post.practice_day_year}/#{@post.practice_day_month}")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    if not params[:time_hour]
      params[:time_hour] = 0
    end
    if not params[:time_minute]
      params[:time_minute] = 0
    end
    if not params[:time_second]
      params[:time_second] = 0
    end
    params[:practice_day] = params[:post][:practice_day]
    post_params = params.require(:post).permit(:id, :practice_timezone, :weather, :place, :kind_of_practice, :strength, :content, :practice_day, :distance, :time_hour, :time_minute, :time_second, :interval_type)
    if post_params[:kind_of_practice] == "インターバル" or post_params[:kind_of_practice] == "レペティション"
      post_params[:distance_m] = post_params[:distance]
      post_params[:distance] = post_params[:distance]/1000
    else
      post_params[:distance_m] = post_params[:distance]
    end
    @post = Post.find_by(id: params[:id])
    @post.practice_day = post_params[:practice_day]
    @post.practice_timezone = post_params[:practice_timezone]
    @post.weather = post_params[:weather]
    @post.place = post_params[:place]
    @post.kind_of_practice = post_params[:kind_of_practice]
    @post.strength = post_params[:strength]
    @post.content = post_params[:content]
    @post.distance = post_params[:distance]
    @post.distance_m = post_params[:distance_m]
    @post.time_hour = post_params[:time_hour]
    @post.time_minute = post_params[:time_minute]
    @post.time_second = post_params[:time_second]
    @post.time_interval_type = post_params[:interval_type]

    @post.user_id = current_user.id
    @post.practice_day_year = @post.practice_day.year
    @post.practice_day_month = @post.practice_day.month
    @post.practice_day_day = @post.practice_day.day
    days = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]
    @post.practice_day_of_week = days[@post.practice_day.wday]
    @post.time_hour = @post.time_hour.to_i
    @post.time_minute = @post.time_minute.to_i
    @post.time_second = @post.time_second.to_i
    if post_params[:kind_of_practice] != "レスト"
      total_seconds = 3600 * @post.time_hour + 60 * @post.time_minute + @post.time_second
      pace = (total_seconds / @post.distance)
      pace_minute = pace.div(60)
      pace_second = pace % 60
      pace_undersecond = pace - pace.to_i
      @post.pace_minute = pace_minute
      @post.pace_second = pace_second
      @post.pace_undersecond = pace_undersecond
    end
    if @post.save
      flash[:notice] = "日誌を編集しました"
      redirect_to("/users/#{current_user.id}/#{@post.practice_day_year}/#{@post.practice_day_month}")
    else
      render("posts/new")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  def destroy_show
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/users/#{@post.user_id}/#{@post.practice_day_year}/#{@post.practice_day_month}")
  end
  def destroy_main
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/users/#{@post.user_id}")
  end
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
