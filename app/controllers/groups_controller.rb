class GroupsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :join]

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
    @group = current_user.groups.build(group_params)
    if @group.save
      args = { user: current_user.id, group: @group.id }
      Membership.add_user_and_group(args)
      redirect_to groups_path, notice: 'Success'
    else
      render :new
    end
  end

  def mygroup
    @memberships = Membership.where(user_id: current_user.id)
  end

  private

  def group_params
    params.require(:group).permit(:tutorial_id, :name)
  end
end
