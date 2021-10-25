class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :notifications, dependent: :destroy

  validates :user_id, presence: true
  validates :group_id, presence: true
end
