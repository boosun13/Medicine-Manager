class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :set_post


    def index
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(title: params[:title],
            user_id: current_user.id,
            sender: params[:user_id])
        if @post.save
            @status = true
        else
            @status = false
            @post.errors
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
    end

    private

    def set_post
        @posts = Post.where(sender: params[:user_id]).order(created_at: :desc).page(params[:page]).per(6)
    end

    def set_user
        unless (params[:user_id].to_i == current_user.id || current_user.admin)
            redirect_to root_path, notice: '権限がありません'
        end 
    end


    

end
