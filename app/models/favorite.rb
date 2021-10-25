class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :diary
  validates_uniqueness_of :diary_id, scope: :user_id

  validates :user_id, presence: true
  validates :diary_id, presence: true
end
