class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new(:id => params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.group_id = params[:id].to_i

    if @post.save
      flash[:notice] = "Successfully posted to post"
      redirect_to group_path(@post.group_id)
    else
      flash[:notice] = "There was an error. Please try again."
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :group_id)
  end
end
