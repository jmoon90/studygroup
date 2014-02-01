class VotesController < ApplicationController
  def create
    learning = Learning.find(params[:learning_id])
    @vote = learning.votes.build(user_id: current_user.id)

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
    @vote = Vote.find(params[:id])
    @vote.destroy

    redirect_to learnings_path, notice: "We heard the swaying of your heart"
  end
end
