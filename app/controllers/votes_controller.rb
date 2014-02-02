class VotesController < ApplicationController
  def create
    @vote = Vote.find_or_create_by(user_id: current_user.id, learning_id: params[:learning_id])

    if @vote.save
      redirect_to learnings_path, notice: "We heard your hearts vote"
    else
      redirect_to learnings_path
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    Vote.destroy(@vote)

    redirect_to learnings_path, notice: "We heard the swaying of your heart"
  end
end
