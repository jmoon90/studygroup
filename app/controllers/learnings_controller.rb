class LearningsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
    user = current_user
    @learnings = Learning.filter_by(params[:sort], user)
  end

  def show
    @learning = Learning.find(params[:id])
  end

  def new
    @learning = Learning.new
  end

  def create
    @learning = current_user.learnings.build(learning_params)

    if @learning.save
      flash[:notice] ='Yay learning is fun!'
      redirect_to learnings_path
    else
      flash[:notice] ='Invalid input. Please try again'
      render :new
    end
  end

  def edit
    @learning = Learning.find(params[:id])
  end

  def update
    @learning = current_user.learnings.build(learning_params)

    if @learning.save
      flash[:notice] ='Yay keep on learning!'
      redirect_to new_learning_path
    else
      flash[:notice] ='Invalid input. Please try again'
      render :edit
    end
  end

  private

  def learning_params
    params.require(:learning).permit(:title, :description, :url, :rank)
  end
end
