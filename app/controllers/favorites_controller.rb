class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(diary_id: params[:diary_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(diary_id: params[:diary_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
