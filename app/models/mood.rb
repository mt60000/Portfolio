class Mood < ApplicationRecord
  has_many :diaries
  has_many :group_diaries
end
