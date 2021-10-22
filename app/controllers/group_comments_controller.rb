class GroupCommentsController < ApplicationController
  def create
    @diary = GroupDiary.find(params[:group_diary_id])
    @comment = @diary.group_comments.new(group_comment_params)
    @comment.user_id = @diary.user_id
    @comment.save
    @comments = @diary.group_comments.order(created_at: 'desc')
    @diary.create_notification_comment!(current_user, @comment.id)
  end

  def destroy
    @diary = GroupDiary.find(params[:group_diary_id])
    @comment = GroupComment.find_by(params[:id])
    @comment.destroy
    @comments = @diary.group_comments.order(created_at: 'desc')
  end


  private
    def group_comment_params
      params.require(:group_comment).permit(:user_id, :group_diary_id, :text)
    end
end
