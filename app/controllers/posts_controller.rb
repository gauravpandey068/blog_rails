class PostsController < ApplicationController

  #home page
  #show all posts
    def index
        @posts = Post.all.order("created_at DESC")
    end

    #show specific post
    def show
        @post = Post.find(params[:id])
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
        @post =Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end


    #delete a post
    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      redirect_to root_path
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

end
