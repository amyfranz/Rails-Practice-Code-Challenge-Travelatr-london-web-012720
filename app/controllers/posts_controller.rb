class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
  
    def show
        @post = Post.find(params[:id])
    end
  
    def new
        @post = Post.new
    end
  
    def edit
        @post = Post.find(params[:id])
    end
  
    def create
        post = Post.new(post_params)
        post.likes = 0
        post.save
        if post.valid?
            redirect_to post
        else
            flash[:errors] = post.errors.full_messages
            redirect_to new_post_path
        end
    end
  
    def update
        post = Post.find(params[:id])
        post.update(post_params)
        if post.valid?
            redirect_to post
        else
            redirect_to edit_post_path(post)
        end
    end
    def like
        post = Post.find(params[:format])
        post.likes += 1
        post.save

        redirect_to post
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end
