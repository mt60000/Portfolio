class AppliesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @applies = @group.applies
  end

  def create
    current_user.applies.create(group_id: apply_params[:group_id])
    redirect_to group_url(apply_params[:group_id])
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
