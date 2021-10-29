class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.includes(:visitor).includes(:visited).includes(:group_diary)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy
    @notifications = current_user.passive_notifications
    @notifications.destroy_all
    redirect_to notifications_url
  end
end
