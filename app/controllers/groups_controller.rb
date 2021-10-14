class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    @owner = @group.group_users.first
    @owner.authority_id = 2  #seed.rbでオーナー権限作成済
    if @group.save
      flash[:notice] = "グループを作成しました。"
      redirect_to group_url(@group)
    else
      flash[:notice] = "グループの作成に失敗しました。"
      render :new
    end
  end

  def index
    @groups = Group.all
  end

  def user_groups
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    if @group.user_join?(current_user)
      @group_user = @group.group_users.find_by(user_id: current_user.id, group_id: @group.id)
      @authority = @group_user.authority
    end
    @applies = current_user.applies
    @apply = @applies.find_by(group_id: @group.id)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
  end

  private
    def group_params
      params.require(:group).permit(:user_id, :name, :password, :policy, :image)
    end
end
