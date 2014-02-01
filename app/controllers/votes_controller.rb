class VotesController < ApplicationController
  def create
    learning = Learning.find(params[:learning_id])
    @vote = current_user.votes.build()
    @vote.learning = learning

    if @vote.save
      flash[:notice] = "We heard the swaying of your heart"
    #  Learning.rank_learning(learning)
      redirect_to learnings_path
    end
  end

  def destroy
    #learning = Learning.find(params[:learning_id])
    #Learning.rank_learning(learning)
    current_user.votes.delete(params[:id])
    redirect_to learnings_path
  end
end
