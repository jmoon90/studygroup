class VotesController < ApplicationController
  def create
    learning = Learning.find(params[:learning_id])
    vote = current_user.votes.build()
    vote.learning = learning

    if vote.save
      HardWorker.perform_async(learn.id)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    current_user.votes.destroy(params[:id])
    learning = params[:learning_id]

    HardWorker.perform_async(learning)
    redirect_to :back
  end
end
