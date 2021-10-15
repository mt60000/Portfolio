class GroupFavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(diary_id: params[:group_diary_id])
    redirect_back(fallback_location: redirect_back(fallback_location: group_diaries_path(@favorite.group_diary.group))
  end

  def destroy
    @favorite = GroupFavorite.find_by(diary_id: params[:group_diary_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: group_diaries_path(@favorite.group_diary.group))
  end
end
