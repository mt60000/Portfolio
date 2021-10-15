class GroupFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :group_diary
  validates_uniqueness_of :group_diary_id, scope: :user_id
end
