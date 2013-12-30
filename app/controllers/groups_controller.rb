class GroupsController < ApplicationController
  attr_reader :group
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def join
    @user = current_user
    @group = Group.find(params[:group_id])
    args = { user: @user.id, group: @group.id }
    msg = Membership.seeder(args)
    if msg == "Too many people in group"
      redirect_to group_path(@group), notice: "Too many people in group"
    else
      Group.add_user_to_group(args)
      redirect_to group_path(@group), notice: "Welcome to the group"
    end
  end

  def leave
    @user = current_user
    @group = Group.find(params[:group_id])
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
