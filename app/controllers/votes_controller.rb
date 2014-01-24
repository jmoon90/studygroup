class VotesController < ApplicationController
  def create
    learning = Learning.find(params[:learning_id])
    vote = current_user.votes.build()
    vote.learning = learning

    if vote.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    current_user.votes.destroy(params[:id])
    redirect_to :back
  end
end
