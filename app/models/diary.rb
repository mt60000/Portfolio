class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :mood

  attachment :image

  validates :user_id, presence: true
  validates :mood_id, presence: true
  validates :keep, length: { maximum: 25 }
  validates :problem, length: { maximum: 25 }
  validates :try, length: { maximum: 25 }
  validates :text, length: { maximum: 255 }
  validates :start_time, presence: true
end
