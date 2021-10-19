class GroupFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :group_diary
  has_many :notifications, dependent: :destroy
  validates_uniqueness_of :group_diary_id, scope: :user_id

end
