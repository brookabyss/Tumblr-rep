class PostsController < ApplicationController
    before_action :find_params, only: [:edit,:show,:update,:destroy]
    
    def index
        @posts = Post.all.order('created_at DESC')
    end
    
    def new
        @post=Post.new
    end
    
    def create
        
        @post=Post.new(post_params)
        if @post.save
            redirect_to @post
        else 
            render 'new'
        end
        
    end
    
    def show
        
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
    
    def find_params
        @post=Post.find(params[:id])
    end
    
end
