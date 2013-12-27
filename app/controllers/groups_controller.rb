class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Success'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:tutorial_id, :name)
  end
end
