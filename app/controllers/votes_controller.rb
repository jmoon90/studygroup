class VotesController < ApplicationController
  def create
    learning = Learning.find(params[:learning_id])
    vote = current_user.votes.build()
    vote.learning = learning


    if vote.save
      Learning.rank_learning(learning, learning.votes_count)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    current_user.votes.destroy(params[:id])

    learning = Learning.find(params[:learning_id])
    Learning.rank_learning(learning, learning.votes_count)
    redirect_to :back
  end
end
