class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :authority

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :authority_id, presence: true
end
