class Group < ApplicationRecord
  has_many :group_user, through: :users
  has_many :group_diaries

  attachment :image
end
