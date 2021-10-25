class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :diaries, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :group_diaries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :group_comments, dependent: :destroy
  has_many :group_favorites, dependent: :destroy
  has_many :applies, dependent: :destroy
  # 自分からの通知
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  # 相手からの通知
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  validates :name, length: { minimum: 1, maximum: 15 }
  validates :policy, length: { maximum: 30 }
  validates :is_valid, presence: true

  def already_favorited?(diary)
    self.favorites.exists?(diary_id: diary.id)
  end

  def group_already_favorited?(group_diary)
    self.group_favorites.exists?(group_diary_id: group_diary.id)
  end

  def active_for_authentication?
    super && (self.is_valid == true)
  end

end
