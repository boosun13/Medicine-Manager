class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_not_first_set
  before_action :set_user

  def index
    @users = User.all
  end

  def show
    @prescriptions = current_user.prescriptions.page(params[:page]).per(3)
    @calendar_fb = if params[:start_date]
                     true
                   else
                     false
                   end
  end

  def set_user
    redirect_to root_path, notice: '権限がありません' unless params[:id].to_i == current_user.id || current_user.admin
  end
end
