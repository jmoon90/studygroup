class MembershipsController < ApplicationController
  def create
    group_id = params[:group_id].to_i
    @membership = Membership.find_or_create_by(user_id: current_user.id, group_id: group_id)

    if @membership.save
      redirect_to group_path(group_id), notice: 'Welcome to the group'
    else
      render group_path(group_id)
    end
  end

  def destroy
    @membership = Membership.where(group_id: params[:group_id],
                                   user_id: params[:id])[0]
    Membership.delete(@membership.id)
    redirect_to group_path(@membership.group), notice: 'Sorry to see you leave'
  end

  private

  def membership_params
    params.require(:membership).permit(:group_id, :user_id)
  end
end
