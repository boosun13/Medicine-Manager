class NotificationsController < ApplicationController
  def update
    @notification = Notification.find(params[:id])
    @notification.checked = if @notification.checked
                              false
                            else
                              true
                            end
    @notification.save
  end

  def destroy
    checked_noti = @notifications.find_by(checked: true)
    checked_noti.destroy
  end
end
