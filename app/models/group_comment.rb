class GroupComment < ApplicationRecord
  belongs_to :user
  belongs_to :group_diary
  has_many :notifications, dependent: :destroy

  validates :text, length: { minimum: 1, maximum: 50 }
end
