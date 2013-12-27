class TutorialsController < ApplicationController
  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)

    if @tutorial.save
      redirect_to groups_path, notice: "Added new tutorial"
    else
      render :new
    end
  end

  private

  def tutorial_params
    params.require(:tutorial).permit(:name)
  end
end
