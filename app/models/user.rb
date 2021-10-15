class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :diaries, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :group_users
  has_many :group_diaries
  has_many :comments
  has_many :favorites
  has_many :group_comments
  has_many :group_favorites
  has_many :applies

  def already_favorited?(diary)
    self.favorites.exists?(diary_id: diary.id)
  end

  def group_already_favorited?(group_diary)
    self.group_favorites.exists?(group_diary_id: group_diary.id)
  end

end
