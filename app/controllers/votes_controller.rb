class VotesController < ApplicationController
  def create
    learning = Learning.find(params[:learning_id])
    vote = current_user.votes.build()
    vote.learning = learning

    if vote.save
      HardWorker.perform_async
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    current_user.votes.destroy(params[:id])

    HardWorker.perform_async
    redirect_to :back
  end
end
