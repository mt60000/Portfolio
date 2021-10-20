class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :group_diaries, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_many :notifications, dependent: :destroy

  attachment :image

  def user_join?(user)
    users.include?(user)
  end

  def create_notification_apply!(current_user, group, apply)
    group.users.each do |user|
      temp = Notification.where(["visitor_id = ? and visited_id = ? and group_id = ? and action= ? ", current_user.id, user.id, id, 'apply'])
      if temp.blank?
        notification = current_user.active_notifications.new(
          group_id: id,
          apply_id: apply.id,
          visited_id: user.id,
          action: 'apply'
        )
      end
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end