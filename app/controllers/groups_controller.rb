class GroupsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :join]

  def index
    @groups = filter_groups(params)
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
      group_memberships_path(@group)
      redirect_to groups_path, notice: 'Success'
    else
      flash[:notice] = "Invalid input. Please try again"
      render :new
    end
  end

  def mygroup
    @memberships = Membership.where(user_id: current_user.id)
  end

  private

  def group_params
    params.require(:group).permit(:tutorial_id, :name, :size)
  end

  def filter_groups(params)
    if params[:filter] == 'highest_user_count'
      Group.highest_user_count
    elsif params[:filter] == 'lowest_user_count'
      Group.lowest_user_count
    else
      Group.all
    end
  end
end
