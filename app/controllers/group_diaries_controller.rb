class GroupDiariesController < ApplicationController
  before_action :current_user?, only: [:edit, :update, :destroy]

  def new
    @group = Group.find(params[:group_id])
    @diary = @group.group_diaries.new
  end

  def create
    @diary = GroupDiary.new(group_diary_params)
    if @diary.save
      flash[:notice] = "日記を投稿しました。"
      redirect_to group_diaries_url(@diary.group_id)
    else
      flash[:notice] = "日記を投稿に失敗しました。"
      render :new
    end
  end

  def index
    @group = Group.find(params[:group_id])
    @diaries = @group.group_diaries.order(created_at: "DESC")
    @favorite = GroupFavorite.new
  end

  def calendar
    @group = Group.find(params[:group_id])
    @diaries = @group.group_diaries
  end

  def show
    @diary = GroupDiary.find(params[:id])
    @group = @diary.group
    @comment = GroupComment.new
    @favorite = GroupFavorite.new
  end

  def edit
    @diary = GroupDiary.find(params[:id])
    @group = @diary.group
  end

  def update
    @diary = GroupDiary.find(params[:id])
    if @diary.update(group_diary_params)
      flash[:notice] = "日記を更新しました。"
      redirect_to group_diary_url(@diary)
    else
      flash[:notice] = "日記の更新に失敗しました。"
      render :edit
    end
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
