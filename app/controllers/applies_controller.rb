class AppliesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @applies = @group.applies
  end

  def create
    @apply = current_user.applies.create(group_id: apply_params[:group_id])
    @group = @apply.group
    @group.create_notification_apply!(current_user, @group, @apply)
    redirect_to group_url(@group)
  end

  def destroy
    @apply = Apply.find(params[:id])
    if @apply.destroy
      redirect_to group_url(@apply.group)
    else
      redirect_to group_url(@apply.group)
    end
  end


  private

    def apply_params
      params.permit(:user_id, :group_id)
    end
end
