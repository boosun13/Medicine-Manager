class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @users = User.all
  end

  def show
    @prescriptions = current_user.prescriptions.page(params[:page]).per(3)
  end

  def set_user
    unless (params[:id].to_i == current_user.id || current_user.admin)
      redirect_to root_path, notice: '権限がありません'
    end 
  end


end
