class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = 'Answer posted successfully'
      redirect_to post_path(@post)
    else
      flash[:notice] = 'There was an error. Please try again'
      render template: 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:answer, :user_id, :post_id)
  end
end
