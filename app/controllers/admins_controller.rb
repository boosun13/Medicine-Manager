class AdminsController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
        @prescriptions = @user.prescriptions
    end

    def m_new
    end

    def m_edit
    end

    def m_create
    end

    def m_update
    end

end
