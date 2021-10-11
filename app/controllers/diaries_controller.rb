class DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def create
    @user = current_user
    @diary = @user.diaries.new(diary_params)
    if @diary.save
      flash[:notice] = "日記を投稿しました。"
      redirect_to diaries_url
    else
      flash[:notice] = "日記を投稿に失敗しました。"
      render :new
    end
  end

  def index
    @user = current_user
    @diaries = @user.diaries
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      flash[:notice] = "日記を更新しました。"
      redirect_to diary_url(@diary)
    else
      flash[:notice] = "日記の更新に失敗しました。"
      render :edit
    end
  end


  private

    def diary_params
      params.require(:diary).permit(:user_id, :mood, :keep, :problem, :try, :text, :image, :start_time)
    end
end
