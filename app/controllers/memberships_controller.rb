class MembershipsController < ApplicationController
  def create
    group_id = params[:membership_id].to_i
    @membership = Membership.find_or_create_by(user_id: current_user.id, group_id: group_id)

    if @membership.save
      redirect_to group_path(group_id), notice: 'Welcome to the group'
    else
      render group_path(group_id)
    end
  end

  def destroy
    group_id = params[:membership_id].to_i
    args = {group_id: group_id, user_id: current_user.id }
    Membership.delete_user_and_group(args)
    redirect_to group_path(group_id), notice: 'Sorry to see you leave'
  end

  private

  def membership_params
    params.require(:membership).permit(:group_id, :user_id)
  end
end
