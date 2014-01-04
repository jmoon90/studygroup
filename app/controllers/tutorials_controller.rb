class TutorialsController < ApplicationController
  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)

    if @tutorial.save
      flash[:notice] = "Added new tutorial"
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def tutorial_params
    params.require(:tutorial).permit(:name, :image)
  end
end
