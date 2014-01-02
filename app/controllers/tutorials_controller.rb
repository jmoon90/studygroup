class TutorialsController < ApplicationController
  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)

    @tutorial.save ? (redirect_to groups_path, notice: "Added new tutorial") :
      (render :new)
  end

  private

  def tutorial_params
    params.require(:tutorial).permit(:name, :image)
  end
end
