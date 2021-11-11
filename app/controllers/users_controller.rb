class UsersController < ApplicationController
  before_action :current_user?, only: %i[edit update leave]

  def show
    @user = User.find(params[:id])
    @groups = @user.groups.order(created_at: 'desc').page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def favorite_diary
    favorites = current_user.favorites.pluck(:diary_id)
    @diaries = Kaminari.paginate_array(Diary.find(favorites).sort.reverse).page(params[:page]).per(6)
  end

  def favorite_group_diary
    group_favorites = current_user.group_favorites.pluck(:group_diary_id)
    @group_diaries = Kaminari.paginate_array(GroupDiary.find(group_favorites).sort.reverse).page(params[:page]).per(6)
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = 'ユーザー情報を変更しました！'
      redirect_to root_url
    else
      flash.now[:alert] = 'ユーザー情報の変更に失敗しました。'
      render :edit
    end
  end

  def confirm
    @user = current_user
  end

  def leave
    user = current_user
    user.update(is_valid: false)
    reset_session
    redirect_to top_url
    flash[:notice] = '退会が完了しました。ご利用ありがとうございました！'
  end

  private

  def user_params
    params.require(:user).permit(:name, :policy, :profile_image)
  end

  def current_user?
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:alert] = '他人の情報は変更できません。'
      redirect_to user_path(current_user)
    end
  end
end
