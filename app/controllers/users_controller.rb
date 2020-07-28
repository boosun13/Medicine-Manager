class UsersController < ApplicationController
  def show
    @prescriptions = current_user.prescriptions.page(params[:page]).per(2)
  end
end
