class NotificationsController < ApplicationController

    
    def update
        @notification = Notification.find(params[:id])
        if @notification.checked
            @notification.checked = false
        else 
            @notification.checked = true
        end
        @notification.save
    end


    def destroy
        checked_noti = @notifications.find_by(checked: true)
        checked_noti.destroy
    end
    private

end
