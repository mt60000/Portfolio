class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def favorite_diary
    @favorites = current_user.favorites.order(created_at: 'desc')
  end

  def favorite_group_diary
    @group_favorites = current_user.group_favorites.order(created_at: 'desc')
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:alert] = "ユーザー情報を変更しました！"
      redirect_to root_url
    else
      flash[:alert] = "ユーザー情報の変更に失敗しました。"
      render :edit
    end
  end

  def confirm
    @user = current_user
  end

  def leave
    @user = current_user
    @user.update(is_valid: false)
    reset_session
    redirect_to top_url
    flash[:alert] = "退会が完了しました。ご利用ありがとうございました！"
  end


  private

    def user_params
      params.require(:user).permit(:name, :policy, :profile_image)
    end
end
