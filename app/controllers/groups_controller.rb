class GroupsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :join]

  def index
    if params[:tutorial].nil?
      @groups = Group.filtered_by(params[:sort])
    else
      @groups = Group.by_tutorial_name(params[:tutorial])
    end
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
    @tutorial = @group.tutorial
    @users = @group.users.pluck(:email)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      group_memberships_path(@group)
      redirect_to groups_path, notice: 'Created group successfully'
    else
      flash[:notice] = "Invalid input. Please try again"
      render :new
    end
  end

  def mygroup
    @memberships = Membership.where(user_id: current_user.id)
    @user = current_user
  end

  private

  def group_params
    params.require(:group).permit(:tutorial_id, :name, :size)
  end
end
