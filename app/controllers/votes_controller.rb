class VotesController < ApplicationController
  def create
    learning = Learning.find(params[:learning_id])
    vote = current_user.votes.build()
    vote.learning = learning


    if vote.save
      Learning.rank_learning(learning, learning.votes_count)
      redirect_to learnings_path
    else
      redirect_to learnings_path
    end
  end

  def destroy
    learning = Learning.find(params[:learning_id])
    Learning.rank_learning(learning, learning.votes_count)

    current_user.votes.destroy(params[:id])
    redirect_to learnings_path
  end
end
