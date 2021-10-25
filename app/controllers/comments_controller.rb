class CommentsController < ApplicationController
  def create
    @diary = Diary.find(params[:diary_id])
    @comment = @diary.comments.new(comment_params)
    @comments = @diary.comments.order(created_at: 'desc')
    @comment.user_id = @diary.user_id
    flash[:alert] = "コメントを送信しました！"
    @comment.save
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    @comment = Comment.find_by(params[:id])
    @comments = @diary.comments.order(created_at: 'desc')
    flash[:alert] = "コメントを削除しました！"
    @comment.destroy
  end


  private
    def comment_params
      params.require(:comment).permit(:user_id, :diary_id, :text)
    end
end
