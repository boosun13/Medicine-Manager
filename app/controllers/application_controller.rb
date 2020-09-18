class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_calendar
  before_action :set_notification

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[birthday name sexes])
  end

  def after_inactive_sign_up_path_for(resource)
    user_path(resource)
  end

  def set_calendar
    @calendars = current_user.prescriptions if current_user
  end

  def set_notification
    # current_userの投稿に紐づいた通知一覧
    @notifications = current_user.passive_notifications if current_user
  end

  def user_not_first_set
    redirect_to edit_user_registration_path, notice: 'ユーザー登録をしてください' unless current_user.birthday?
  end
end
