class CommentsController < ApplicationController
    before_action :authenticate_user!


    def new
        @comment = Comment.new
        @post = Post.find_by(id: params[:post_id])
    end

    def create
        @comment = Comment.new(content: params[:content],
            user_id: current_user.id,
            post_id: params[:post_id])
        if @comment.save
            @status = true
            @post = @comment.post
        else
            @status = false
            @post = Post.find_by(id: params[:post_id])
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        @post = @comment.post
        @comment.destroy
    end

    private


end