class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :authority

  def create_notification_group_user!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ", current_user.id, id, 'group_user'])
      if temp.blank?
        notification = current_user.active_notifications.new(
          group_id: group_id,
          visited_id: id,
          action: 'group_user'
        )
        notification.save if notification.valid?
      end
  end
end
