class CommentsController < ApplicationController
  before_action :current_user?, only: [:destroy]

  def create
    @diary = Diary.find(params[:diary_id])
    @comment = @diary.comments.new(comment_params)
    @comments = @diary.comments.order(created_at: 'desc')
    @comment.user_id = @diary.user_id
    unless @comment.save
      render :error
    end
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    @comment = Comment.find_by(params[:id])
    @comments = @diary.comments.order(created_at: 'desc')
    @comment.destroy
  end


  private
    def comment_params
      params.require(:comment).permit(:user_id, :diary_id, :text)
    end

    def current_user?
      @comment = Comment.find(params[:id])
      unless @comment.user_id == current_user.id
        flash[:alert] = "他人のコメントです。"
        redirect_to diary_url(@comment.diary)
      end
    end
end
