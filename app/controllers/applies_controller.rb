class AppliesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @applies = @group.applies
  end

  def create
    @apply = current_user.applies.create(group_id: apply_params[:group_id])
    @group = @apply.group
    @group.create_notification_apply!(current_user, @group, @apply)
    flash[:alert] = "グループ「#{@group.name}」に参加申請を送信しました！"
    redirect_to group_url(@group)
  end

  def destroy
    @apply = Apply.find(params[:id])
    if @apply.destroy
      flash[:alert] = "グループ「#{@apply.group.name}」への参加申請を取り消しました！"
      redirect_to group_url(@apply.group)
    else
      flash[:alert] = "グループ「#{@apply.group.name}」への参加申請を取り消せませんでした。"
      redirect_to group_url(@apply.group)
    end
  end


  private

    def apply_params
      params.permit(:user_id, :group_id)
    end
end
