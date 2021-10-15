class GroupDiary < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :group_comments
  has_many :group_favorites
  attachment :image
end
