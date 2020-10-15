class PostsController < ApplicationController

    def index
        # we want all posts to show up on our index/ home
        @posts = Post.all.order("created_at DESC") # easy to make SQL queries
    end

    def new
        @post = Post.new 
    end

    def create
        # pass into our create, when called
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else 
            render 'new'
        end

    end

    def show  
        # finding a Post Id based off it's ID
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

    # a private class method
    private
    def post_params
        # secruity method .permit() that only these can be sent to the db
        params.require(:post).permit(:title, :content)
    end

end
