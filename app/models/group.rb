class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :group_diaries
  has_many :applies

  attachment :image

  def user_join?(user)
    users.include?(user)
  end
end
