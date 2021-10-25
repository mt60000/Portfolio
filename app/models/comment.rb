class Comment < ApplicationRecord
  belongs_to :user
  validates :text, length: { minimum: 1, maximum: 50 }
end