class Diary < ApplicationRecord
  belongs_to :user
  has_many :group, through: :group_diaries
  has_many :comments
  has_many :stamps

  attachment :image

  enum mood:{ so_bad: 0, bad: 1, so_so: 2, good: 3, so_good: 4 }
end
