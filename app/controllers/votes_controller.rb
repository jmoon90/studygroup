class VotesController < ApplicationController
  def create
    learning = Learning.find(params[:learning_id])
    @vote = Vote.find_or_create_by(user_id: current_user.id, learning_id: learning.id)
    Learning.rank_learning(learning)

    if @vote.save
      redirect_to learnings_path, notice: "We heard your hearts vote"
    else
      redirect_to learnings_path
    end
  end

  def destroy
    #@learning = Learning.find(params[:learning_id])
    #Learning.rank_learning(@learning)

    @vote = Vote.find(params[:id])
    Vote.destroy(@vote)
    redirect_to groups_path, notice: "We heard the swaying of your heart"
  end
end
