class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :favorites
  belongs_to :mood

  attachment :image
end
