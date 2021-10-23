class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(diary_id: params[:diary_id])
    @diary = @favorite.diary
  end

  def destroy
    @favorite = Favorite.find_by(diary_id: params[:diary_id], user_id: current_user.id)
    @diary = @favorite.diary
    @favorite.destroy
  end
end
