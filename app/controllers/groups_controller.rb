class GroupsController < ApplicationController
  attr_reader :group
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = Group.new(group_params)

    if @group.save
      args = { user: @user.id, group: @group.id }
      Membership.seeder(args)
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
