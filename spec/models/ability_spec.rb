require 'spec_helper'
require 'cancan/matchers'

# see also: https://github.com/ryanb/cancan/wiki/Testing-Abilities

module AbilityExampleHelpers
  def should_be_able_to(actions, model_or_symbol)
    actions.each do |action|
      it "should allow #{action} on #{model_or_symbol}" do
        that = model_or_symbol.is_a?(Symbol) ? self.send(model_or_symbol) : model_or_symbol
        ability.should be_able_to action, that
      end
    end
  end

  def should_not_be_able_to(actions, model_or_symbol)
    actions.each do |action|
      it "should not allow #{action} on #{model_or_symbol}" do
        that = model_or_symbol.is_a?(Symbol) ? self.send(model_or_symbol) : model_or_symbol
        ability.should_not be_able_to action, that
      end
    end
  end
end

describe Ability do
  context "when no user logged in" do
    let(:ability) { Ability.new(nil) }

    context "UsersController" do
      extend AbilityExampleHelpers
      let(:user) { User.new }

      should_be_able_to [:home, :index], User
      should_be_able_to [:show], :user
      should_not_be_able_to [:edit, :update, :destroy], :user
    end

    context "User::ProfilesController" do
      extend AbilityExampleHelpers
      let(:profile) { user.profile }
      let(:user) { User.new }
      before do
        profile.stub(:user).and_return(user)
      end

      should_not_be_able_to [:edit, :update, :destroy], :profile
    end

    context "ProjectsController" do
      extend AbilityExampleHelpers
      let(:project) { Project.new }

      should_be_able_to [:home, :index], User
      should_be_able_to [:show], :project
      should_not_be_able_to [:edit, :update, :destroy], :project
    end
  end

  context "when user logged in" do
    let(:ability) { Ability.new(current_user) }
    let(:current_user) { User.new }

    before do
      current_user.stub(:id).and_return(1)
    end

    context "UsersController" do
      extend AbilityExampleHelpers
      let(:other_user) { User.new }

      before do
        other_user.stub(:id).and_return(2)
      end

      should_be_able_to [:edit, :update, :destroy], :current_user
      should_not_be_able_to [:edit, :update, :destroy], :other_user
    end

    context "User::ProfilesController" do
      extend AbilityExampleHelpers
      let(:current_user_profile) { current_user.profile }
      let(:other_user_profile) { other_user.profile }
      let(:other_user) { User.new }

      before do
        current_user_profile.stub(:user).and_return(current_user)
        other_user.stub(:id).and_return(2)
        other_user_profile.stub(:user).and_return(other_user)
      end

      should_be_able_to [:edit, :update, :destroy], :current_user_profile
      should_not_be_able_to [:edit, :update, :destroy], :other_user_profile
    end

    context "ProjectsController" do
      let(:project) { Project.new }

      context "when user is an owner of the project" do
        extend AbilityExampleHelpers
        before do
          current_user.should_receive(:is_owner_of?).with(project).and_return(true)
        end

        should_be_able_to [:edit, :update, :destroy], :project
      end

      context "when user is not an owner of the project" do
        extend AbilityExampleHelpers
        before do
          current_user.should_receive(:is_owner_of?).with(project).and_return(false)
        end

        should_not_be_able_to [:edit, :update, :destroy], :project
      end
    end

    context "Project::MembershipsController" do
    end
  end
end
