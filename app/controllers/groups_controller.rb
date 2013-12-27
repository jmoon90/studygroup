class GroupsController < ApplicationController
  attr_reader :group
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    binding.pry

    current_user = current_user.id

    args = { group: group.id, user: current_user }
    Membership.seeder(args)
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
