class AdminsController < ApplicationController
    before_action :set_admin

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
        @prescriptions = @user.prescriptions
    end

    def set_admin
        @user = User.find_by(id: params[:admin_id])
    end

end
