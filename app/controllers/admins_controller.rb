class AdminsController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
        @prescriptions = @user.prescriptions
        
    end

end
