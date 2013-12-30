class GroupsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def seed_membership(args)
    Membership.add_user_and_group(args)
  end

  def current_user_and_group
    @user = current_user
    @group = Group.find(params[:group_id])
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def join
    current_user_and_group
    args = { user: @user.id, group: @group.id }
    notice = seed_membership(args)

    redirect_to group_path(@group), notice: notice
  end

  def leave
    current_user_and_group
    individual_mem = Membership.where(group_id: @group, user_id: @user.id)
    Membership.delete(individual_mem)
    redirect_to group_path(@group), notice: "Sorry to see you leave"
  end

  def mygroup
    @user = current_user
    @memberships = Membership.where(user_id: @user.id)
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = Group.new(group_params)

    if @group.save
      args = { user: @user.id, group: @group.id }
      Membership.add_user_and_group(args)
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
