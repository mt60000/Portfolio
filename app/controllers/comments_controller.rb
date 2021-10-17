class CommentsController < ApplicationController
  def create
    @diary = Diary.find(params[:diary_id])
    @comment = @diary.comments.new(comment_params)
    @comment.user_id = @diary.user_id
    if @comment.save
      redirect_to diary_url(@diary)
    else
      flash[:notice] = "コメントの送信に失敗しました。"
      redirect_to diary_url(@diary)
    end
  end

  def destroy
    @comment = Comment.find_by(params[:id])
    if @comment.destroy
      redirect_to diary_url(@comment.diary_id)
    else
      flash[:notice] = "コメントの削除に失敗しました。"
      redirect_to diary_url(@comment.diary_id)
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:user_id, :diary_id, :text)
    end
end
