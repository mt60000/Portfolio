class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
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

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
  end

  def join
  end

  def leave
  end


  private
    def group_params
      params.require(:group).permit(:name, :password, :policy, :image)
    end
end
