class GroupDiary < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :mood
  has_many :group_comments, dependent: :destroy
  has_many :group_favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy
  attachment :image

  def create_notification_favorite!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and group_diary_id = ? and action= ? ", current_user.id, user_id, id, 'group_favorite'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        group_diary_id: id,
        visited_id: user_id,
        action: 'group_favorite'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, group_comment_id)
    temp_ids = GroupComment.select(:user_id).where(group_diary_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, group_comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, group_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, group_comment_id, visited_id)
    notification = current_user.active_notifications.new(
      group_diary_id: id,
      group_comment_id: group_comment_id,
      visited_id: visited_id,
      action: 'group_comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
