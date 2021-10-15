class GroupFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :group_diary
end
