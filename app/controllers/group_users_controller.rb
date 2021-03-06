class GroupUsersController < ApplicationController
  before_action :authority_member_control, only: [:create]

  def role
    @group = Group.find(params[:group_id])
    @group_users = @group.group_users.includes(:user).includes(:authority)
  end

  def role_change
    @group = Group.find(params[:group_id])
    group_users = group_users_params
    group_users.to_h.map do |id, group_user_params|
      group_user = GroupUser.find(id)
      group_user.update_attributes(group_user_params)
      group_user
    end
    flash[:notice] = '権限を変更しました！'
    redirect_to group_url(@group)
  end

  def create
    @group = Group.find(params[:group_id])
    group_user = @group.group_users.create(user_id: group_user_params[:user_id], authority_id: "member")
    Apply.find(group_user_params[:apply_id]).destroy!
    flash[:notice] = "「#{group_user.user.name}」さんがグループ「#{@group.name}」に参加しました！"
    redirect_to group_applies_url(@group)
  end

  def destroy
    group_user = GroupUser.find(params[:id])
    @group = group_user.group
    if group_user.destroy
      if @group.group_users.blank?  # メンバーが0のときグループを削除
        @group.destroy
        flash[:notice] = "グループ「#{group.name}」を削除しました。"
        return redirect_to groups_search_url
      end
      flash[:notice] = if group_user == current_user
                         "グループ「#{@group.name}」を退会しました。"
                       else
                         "「#{group_user.user.name}」さんをグループ「#{@group.name}」から退会させました。"
                       end
      redirect_to group_url(@group)
    else
      flash[:alert] = "グループ「#{group.name}」を退会できませんでした。"
      redirect_to group_url(@group)
    end
  end

  private

  def group_user_params
    params.permit(:group_id, :user_id, :apply_id, :authority_id)
  end

  def group_users_params
    params.require(:group_user).permit(group_users: :authority_id)[:group_users]
  end

  def authority_member_control
    @group = Group.find(params[:group_id])
    @group_user = @group.group_users.find_by(user_id: current_user.id, group_id: @group.id)
    redirect_to group_search_url unless @group_user.authority.role == "leader" || @group_user.authority.role == "subleader"
  end
end
