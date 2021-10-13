class AppliesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @applies = @group.apllies
  end

  def create
    current_user.applies.create(group_id: apply_params[:group_id])
    redirect_to group_url(apply_params[:group_id])
  end

  def destroy
    @group = Group.find(params[:group_id])
    @apply = @group.apllies.find(params[:id])
    if @apply.destroy
      redirect_to group_url(@group)
    else
      redirect_to group_applies_url(@group)
    end
  end


  private

    def apply_params
      params.require(:apply).permit(:user_id, :group_id)
    end
end
