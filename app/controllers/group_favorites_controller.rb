class GroupFavoritesController < ApplicationController
  before_action :current_user?, only: [:destroy]

  def create
    @favorite = current_user.group_favorites.create(group_diary_id: params[:group_diary_id])
    @diary = @favorite.group_diary
    @diary.create_notification_favorite!(current_user)
  end

  def destroy
    @favorite = GroupFavorite.find_by(group_diary_id: params[:group_diary_id], user_id: current_user.id)
    @diary = @favorite.group_diary
    @favorite.destroy
  end

  private

  def current_user?
    @favorite = GroupFavorite.find(params[:id])
    flash[:alert] = '他人のお気に入りを解除することはできません。' unless @favorite.user_id == current_user.id
  end
end
