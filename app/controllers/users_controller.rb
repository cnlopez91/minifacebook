class UsersController < ApplicationController
    def index
        @all_users = User.all
    end
    
    def show
        @all_user = User.all
    end
    
    def addfriend
        friendship = Friendship.new
        friendship.user_id = current_user.id
        friendship.friend_id = params[:friend_id]
        friendship.save
        
        @friendUser_obj = User.find(params[:friend_id])
        
    end
    
    def userwall
        @user = User.find(params[:id])
        
        @posts = Post.where(user_id: @user.id)
        
        @comments = Comment.where(user_id: @user.id)
    end
    
    def post
        post = Post.new
        post.content = params[:post]
        post.user_id = current_user.id
        post.save
        
        redirect_to "/userwall?id=#{current_user.id}"
    end
    
    def comment
        comment = Comment.new
        comment.content = params[:comment]
        comment.user_id = current_user.id
        comment.post_id = params[:post_id]
        comment.save
        
        user_post = User.find((Post.find(params[:post_id])).user_id)
        
        redirect_to "/userwall?id=#{user_post.id}"
    end
    
    def post_destroy
        user_post = User.find((Post.find(params[:id])).user_id)
        
        Post.find(params[:id]).destroy
        
        redirect_to "/userwall?id=#{user_post.id}"
    end
    
    def delete
        Book.find(params[:id]).destroy
        redirect_to :action => 'list'
    end
    
end
