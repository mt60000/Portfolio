class GroupCommentsController < ApplicationController
  def create
    @diary = GroupDiary.find(params[:group_diary_id])
    @comment = @diary.group_comments.new(group_comment_params)
    @comment.user_id = @diary.user_id
    if @comment.save
      @diary.create_notification_comment!(current_user, @comment.id)
      redirect_to group_diary_url(@diary)
    else
      flash[:notice] = "コメントの送信に失敗しました。"
      redirect_to group_diary_url(@diary)
    end
  end

  def destroy
    @comment = GroupComment.find_by(params[:id])
    if @comment.destroy
      redirect_to group_diary_url(@comment.group_diary_id)
    else
      flash[:notice] = "コメントの削除に失敗しました。"
      redirect_to group_diary_url(@comment.group_diary_id)
    end
  end


  private
    def group_comment_params
      params.require(:group_comment).permit(:user_id, :group_diary_id, :text)
    end
end
