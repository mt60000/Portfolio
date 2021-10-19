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

  def create_notification_apply!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and group_id and action= ? ", current_user.id, apply.user_id, id, 'apply'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: apply.user_id,
        group_id: id,
        apply_id: id,
        action: 'apply'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end