class Diary < ApplicationRecord
  belongs_to :user
  has_many :group, through: :group_diaries
  has_many :comments
  has_many :stamps
end
