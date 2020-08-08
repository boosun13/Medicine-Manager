class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @prescriptions = current_user.prescriptions.page(params[:page]).per(3)
  end

end
