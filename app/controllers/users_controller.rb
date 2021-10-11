class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を変更しました。"
      redirect_to user_url(@user)
    else
      flash[:notice] = "ユーザー情報の変更に失敗しました。"
      render :edit
    end
  end

  def leave
  end


  private

    def user_params
      params.require(:user).permit(:name, :policy, :profile_image)
    end
end
