class VotesController < ApplicationController
  def create
    learning = Learning.find(params[:learning_id])
    @vote = Vote.find_or_create_by(user_id: current_user.id, learning_id: learning.id)

    if @vote.save
      Learning.rank_learning(learning)
      redirect_to learnings_path, notice: "We heard your hearts vote"
    else
      redirect_to learnings_path
    end
  end

  def destroy
    @learning = Learning.find(params[:learning_id])
    Learning.rank_learning(@learning)
    Vote.destroy(@learning.vote_from(current_user))
    redirect_to learnings_path, notice: "We heard the swaying of your heart"
  end
end
