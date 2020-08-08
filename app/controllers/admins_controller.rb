class AdminsController < ApplicationController
    before_action :if_not_admin
    before_action :set_admin

    def index
        @q = User.ransack(params[:q])
        @users = @q.result(distinct: true).page(params[:page]).per(5)
    end

    def show
        @user = User.find_by(id: params[:id])
        @prescriptions = @user.prescriptions
    end

    def create
        @user.admin = true
        if @user.save
            render :index
        else
            render :index
        end
    end



    def search
        @q = User.search(search_params)
        @users = @q.result(distinct: true).page(params[:page]).per(5)
    end
    
    private
    def search_params
        params.require(:q).permit!
    end



    def set_admin
        @user = User.find_by(id: params[:admin_id])
    end

    def if_not_admin
        redirect_to root_path, notice: '権限がありません。' unless current_user.admin?
    end

end
