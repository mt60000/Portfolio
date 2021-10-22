class GroupFavoritesController < ApplicationController
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
end
