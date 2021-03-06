class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy]

  #home page
  #show all posts
    def index
        @posts = Post.all.order("created_at DESC")
    end

    #show specific post
    def show
    end

    #add new post
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            render 'new'
        end

    end

    #update a posts
    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit
    end


    #delete a post
    def destroy
      @post.destroy
      redirect_to root_path
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
