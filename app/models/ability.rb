class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # - https://github.com/ryanb/cancan/wiki/Defining-Abilities
    # - https://github.com/ryanb/cancan/wiki/Defining-Abilities-with-Blocks

    user ||= User.new

    if user.id.present? then
      #Everything only logged in users may do.

      #Projects
      can :manage, Project do |project|
        user.is_owner_of?(project)
      end
      can :create, Project

      #Project membership
      can :request_membership, Project
      can [:accept_member, :deny], Project::Membership do |membership|
        user.is_owner_of?(membership.project)
      end

      #User
      can :manage, User do |user_model|
        user.id == user_model.id
      end

      #User::Profile
      can :manage, User::Profile do |profile|
        user.id == profile.user.id
      end
    else
      #Everything only guest users may do.

    end

    #Everything both logged in users and guest users may do.

    #read on all
    can :read, :all
    can :home, :all
  end
end
