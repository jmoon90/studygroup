class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new(id: params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.group_id = params[:id].to_i

    if @post.save
      flash[:notice] = "Successfully posted to post"
      redirect_to group_path(@post.group)
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
