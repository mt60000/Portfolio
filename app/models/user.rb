class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :diaries
  has_many :groups, through: :group_users
  has_many :group_users
  has_many :group_diaries
  has_many :comments
  has_many :stapms
end
