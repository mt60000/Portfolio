class FavoritesController < ApplicationController
  before_action :current_user?, only: [:destroy]

  def create
    @favorite = current_user.favorites.create(diary_id: params[:diary_id])
    @diary = @favorite.diary
  end

  def destroy
    @favorite = Favorite.find_by(diary_id: params[:diary_id], user_id: current_user.id)
    @diary = @favorite.diary
    @favorite.destroy
  end


  private

    def current_user?
      @favorite = Favorite.find(params[:id])
      unless @favorite.user_id == current_user.id
        flash[:alert] = "他人のお気に入りを解除することはできません。"
      end
    end

end
