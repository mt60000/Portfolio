class DiariesController < ApplicationController
  before_action :current_user?, only: %i[show edit update destroy]

  def new
    @diary = Diary.new
  end

  def create
    @user = current_user
    @diary = @user.diaries.new(diary_params)
    if @diary.save
      flash[:notice] = '日記を投稿しました！'
      redirect_to root_url
    else
      flash.now[:alert] = '日記の投稿に失敗しました。'
      render :new
    end
  end

  def index
    @user = current_user
    @diaries = @user.diaries.includes(:mood).order(created_at: 'desc').page(params[:page]).per(6)
    @favorite = Favorite.new
  end

  def calendar
    @diaries = current_user.diaries.includes(:mood)
  end

  def show
    @diary = Diary.find(params[:id])
    @comment = Comment.new
    @comments = @diary.comments.includes(:user)
    @favorite = Favorite.new
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      flash[:notice] = '日記を更新しました！'
      redirect_to diary_url(@diary)
    else
      flash.now[:alert] = '日記の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @diary = Diary.find(params[:id])
    if @diary.destroy
      flash[:notice] = '日記を削除しました！'
      redirect_to root_url
    else
      flash[:alert] = '日記を削除できませんでした。'
      redirect_to root_url
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :mood_id, :keep, :problem, :try, :text, :image, :start_time)
  end

  def current_user?
    @diary = Diary.find(params[:id])
    unless @diary.user_id == current_user.id
      flash[:alert] = '他人の投稿です。'
      redirect_to root_url
    end
  end
end
