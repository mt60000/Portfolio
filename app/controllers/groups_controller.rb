class GroupsController < ApplicationController
  before_action :ensure_correct_group_user, only: [:edit, :update, :destroy]
  before_action :authority_deletem, only: [:destroy]
  before_action :authority_change, only: [:edit, :update]

  def new
    @new_group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    @owner = @group.group_users.first
    @owner.authority_id = 1  #seed.rbでroleを作成
    if @group.save
      flash[:notice] = "グループを作成しました。"
      redirect_to group_url(@group)
    else
      flash[:notice] = "グループの作成に失敗しました。"
      render :new
    end
  end

  def index
    @groups = current_user.groups
  end

  def search
    @groups = Group.all
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

  def calendar
    @group = Group.find_by(params[:id])
    @group_users = @group.users
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_url(@group)
    else
      redirect_to group_url(@group)
    end
  end

  def destroy
    @group = Group.find_by(params[:id])
    if @group.destroy
      redirect_to groups_url(current_user)
    else
      redirect_to groups_url(current_user)
    end
  end

  private
    def group_params
      params.require(:group).permit(:user_id, :name, :password, :policy, :image)
    end

    def ensure_correct_group_user
      @group = Group.find(params[:id])
      unless @group.user_join?(current_user)
        redirect_to group_search_url
      end
    end

    def authority_delete
      @group = Group.find(params[:id])
      @group_user = @group.group_users.find_by(user_id: current_user.id, group_id: @group.id)
      unless @group_user.authority.role == "leader"
        redirect_to group_search_url
      end
    end

    def authority_change
      @group = Group.find(params[:id])
      @group_user = @group.group_users.find_by(user_id: current_user.id, group_id: @group.id)
      unless @group_user.authority.role == "leader" || @group_user.authority.role == "subleader"
        redirect_to group_search_url
      end
    end

end
