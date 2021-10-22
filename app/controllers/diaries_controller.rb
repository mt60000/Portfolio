class DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def create
    @user = current_user
    @diary = @user.diaries.new(diary_params)
    if @diary.save
      flash[:notice] = "日記を投稿しました。"
      redirect_to root_url
    else
      flash[:notice] = "日記を投稿に失敗しました。"
      render :new
    end
  end

  def index
    @user = current_user
    @diaries = @user.diaries.order(created_at: "DESC")
    @favorite = Favorite.new
  end

  def calendar
    @diaries = current_user.diaries
  end

  def show
    @diary = Diary.find(params[:id])
    @comment = Comment.new
    @comments = @diary.comments
    @favorite = Favorite.new
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

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_url
  end


  private

    def diary_params
      params.require(:diary).permit(:user_id, :mood_id, :keep, :problem, :try, :text, :image, :start_time)
    end
end
