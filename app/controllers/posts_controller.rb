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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Successfully edited post"
      redirect_to posts_path(params[:id])
    else
      flash[:notice] = "There was an error. Please try again."
      render :edit
    end
  end

  def filter_tags
    @tag = Tag.find(params[:format])
    @posts = Post.joins(:tags).where(tags: {id: @tag.id})
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :tag_list)
  end
end
