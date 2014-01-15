class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'Answer posted successfully'
      redirect_to post_path(@post)
    else
      flash.now[:notice] = 'There was an error. Please try again'
      render template: 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:answer, :user_id, :post_id)
  end
end
