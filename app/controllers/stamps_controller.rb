class StampsController < ApplicationController
  def create
    @stamp = Stamp.new(comment_params)
    if @stamp.save
      redirect_to reqest.referer
    else
      flash[:notice] = "スタンプの送信に失敗しました。"
      redirect_to reqest.referer
    end
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    @stamp = @diary.find(params[:id])
    if @stamp.destroy
      redirect_to diary_url(@diary)
    else
      flash[:notice] = "スタンプの削除に失敗しました。"
    end
  end


  private

    def stamp_params
      params.require(:stamp).permit(:user_id, :diary_id, :stamp)
    end
end
