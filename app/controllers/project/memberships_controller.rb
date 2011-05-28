class Project::MembershipsController < ApplicationController
  #PUT accept_invitation with membership_id
  def accept_invitation
    membership = Project::Membership.find(params[:membership_id])
    membership.accept_invitation

    redirect_to :back
  end

  #PUT accept_member with membership_id
  def accept_member
    membership = Project::Membership.find(params[:membership_id])
    if current_user.is_owner_of?(membership.project)
      membership.accept_member
    end

    redirect_to :back
  end

  #PUT deny with membership_id
  def deny
    membership = Project::Membership.find(params[:membership_id])
    if current_user.is_owner_of?(membership.project)
      membership.destroy
    end

    redirect_to :back
  end
end
