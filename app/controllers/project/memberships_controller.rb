class Project::MembershipsController < ApplicationController
  # FIXME: Get rid of before_filter by figuring out if load_and_authorize_resource
  #        can load by membership_id instead of id. Or refactor everything to id.
  before_filter :find_membership
  authorize_resource :class => "Project::Membership"

  #PUT accept_invitation with membership_id
  def accept_invitation
    @membership.accept_invitation

    redirect_to :back
  end

  #PUT accept_member with membership_id
  def accept_member
    @membership.accept_member

    redirect_to :back
  end

  #PUT deny with membership_id
  def deny
    @membership.destroy

    redirect_to :back
  end

  private

  def find_membership
    @membership = Project::Membership.find(params[:membership_id])
  end
end
