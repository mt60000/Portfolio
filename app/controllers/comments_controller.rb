class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to reqest.referer
    else
      flash[:notice] = "コメントの送信に失敗しました。"
      redirect_to reqest.referer
    end
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    @comment = @diary.find(params[:id])
    if @comment.destroy
      redirect_to diary_url(@diary)
    else
      flash[:notice] = "コメントの削除に失敗しました。"
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:user_id, :diary_id, :text)
    end
end
