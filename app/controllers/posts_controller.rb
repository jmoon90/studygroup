class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Successfully posted to post"
      redirect_to post_path(@post)
    else
      flash[:notice] = "There was an error. Please try again."
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
