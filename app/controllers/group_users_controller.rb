class GroupUsersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @apply = Apply.find(params[:apply_id])
    @group_user = @group.group_users.create(user_id: group_user_params[:user_id], authority_id: 1)
    Apply.find(group_user_params[:apply_id]).destroy!
    redirect_to group_applies_url(@group)
  end

  def destroy
    @group_user = GroupUser.find(params[:id])
    if @group_user.destroy
      redirect_to group_url(@group_user.group)
    else
      redirect_to group_url(@group_user.group)
    end
  end


  private

  def group_user_params
    params.permit(:group_id, :user_id, :apply_id, :authority_id)
  end

end
