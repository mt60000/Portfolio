class GroupUsersController < ApplicationController
  before_action :authority_member_control, only: [:create]

  def role
    @group = Group.find(params[:group_id])
    @group_users = @group.group_users
  end

  def role_change
    @group = Group.find(params[:group_id])
    @group_users = @group.group_users
    if @group_users.update(group_user_params)
      redirect_to group_url(@group)
    else
      redirect_to group_url(@group)
    end
    # @group_users.each do |user|
    #   user.update(group_user_params)
    # end
    # redirect_to group_url(@group)
  end

  def create
    @group = Group.find(params[:group_id])
    @apply = Apply.find(params[:apply_id])
    @group_user = @group.group_users.create(user_id: group_user_params[:user_id], authority_id: 3)
    Apply.find(group_user_params[:apply_id]).destroy!
    redirect_to group_applies_url(@group)
  end

  def destroy
    @group_user = GroupUser.find(params[:id])
    @group = @group_user.group
    if @group_user.destroy
      if @group.group_users.blank?  #メンバーが0のときグループを削除
        @group.destroy
        return redirect_to groups_search_url
      end
      redirect_to group_url(@group_user.group)
    else
      redirect_to group_url(@group_user.group)
    end
  end


  private

  def group_user_params
    params.permit(:group_id, :user_id, :apply_id, :authority_id)
  end

  def authority_member_control
    @group = Group.find(params[:group_id])
    @group_user = @group.group_users.find_by(user_id: current_user.id, group_id: @group.id)
    unless @group_user.authority.role == "leader" || @group_user.authority.role == "subleader"
      redirect_to group_search_url
    end
  end
end
