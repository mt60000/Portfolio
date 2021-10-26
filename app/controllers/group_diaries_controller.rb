class GroupDiariesController < ApplicationController
  before_action :current_user?, only: [:edit, :update, :destroy]

  def new
    @diary = GroupDiary.new
    @group = Group.find_by(id: params[:group_id])
    @diary.user_id = current_user.id
    @diary.group_id = @group.id
  end

  def create
    @diary = GroupDiary.new(group_diary_params)
    @group = Group.find_by(id: params[:group_diary][:group_id])
    @diary.user_id = current_user.id
    @diary.group_id = @group.id
    if @diary.save
      flash[:alert] = "日記を投稿しました！"
      redirect_to group_group_diaries_url(@diary.group_id)
    else
      flash.now[:alert] = "日記の投稿に失敗しました。"
      render :new
    end
  end

  def index
    @group = Group.find_by(id: params[:group_id])
    @diaries = @group.group_diaries.order(created_at: "desc").page(params[:page]).per(6)
    @favorite = GroupFavorite.new
  end

  def calendar
    @group = Group.find_by(params[:group_id])
    @group_users = @group.users
  end

  def show
    @diary = GroupDiary.find(params[:id])
    @group = @diary.group
    @comment = GroupComment.new
    @comments = @diary.group_comments.order(created_at: 'desc')
    @favorite = GroupFavorite.new
  end

  def edit
    @diary = GroupDiary.find(params[:id])
    @group = @diary.group
  end

  def update
    @diary = GroupDiary.find(params[:id])
    if @diary.update(group_diary_params)
      flash[:alert] = "日記を更新しました！"
      redirect_to group_diary_url(@diary)
    else
      flash.now[:alert] = "日記の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @diary = GroupDiary.find(params[:id])
    @diary.destroy
    flash[:alert] = "日記を削除しました！"
    redirect_to group_diaries_url(@diary.group)
  end


  private

    def group_diary_params
      params.require(:group_diary).permit(:user_id, :group_id, :mood_id, :keep, :problem, :try, :text, :image, :start_time)
    end

    def current_user?
      @diary = GroupDiary.find(params[:id])
      unless @diary.user_id == current_user.id
        redirect_to group_group_diaries_url(@diary.group)
      end
    end
end
