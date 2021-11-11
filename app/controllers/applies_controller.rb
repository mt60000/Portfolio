class AppliesController < ApplicationController
  before_action :current_user?, only: [:destroy]
  before_action :user_join?, only: [:index]

  def index
    @group = Group.find(params[:group_id])
    @applies = @group.applies
  end

  def create
    apply = current_user.applies.create(group_id: apply_params[:group_id])
    @group = apply.group
    @group.create_notification_apply!(current_user, @group, apply)
    flash[:notice] = "グループ「#{@group.name}」に参加申請を送信しました！"
    redirect_to group_url(@group)
  end

  def destroy
    apply = Apply.find(params[:id])
    @group = apply.group
    if apply.destroy
      flash[:notice] = "グループ「#{@group.name}」への参加申請を取り消しました！"
      redirect_to group_url(@group)
    else
      flash[:alert] = "グループ「#{@group.name}」への参加申請を取り消せませんでした。"
      redirect_to group_url(@group)
    end
  end

  private

  def apply_params
    params.permit(:user_id, :group_id)
  end

  def current_user?
    @apply = Apply.find(params[:id])
    unless @apply.user_id == current_user.id
      flash[:alert] = '他人の申請を取り消すことはできません。'
      redirect_to group_url(@apply.group)
    end
  end

  def user_join?
    @group = Group.find(params[:group_id])
    unless @group.users.include?(current_user)
      flash[:alert] = "「#{@group.name}」に参加していません。"
      redirect_to group_url(@group)
    end
  end
end
