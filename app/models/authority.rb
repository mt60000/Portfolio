class Authority < ApplicationRecord
  has_many :group_users

  self.primary_key = "role"
end
