require 'spec_helper'
require 'cancan/matchers'

# see also: https://github.com/ryanb/cancan/wiki/Testing-Abilities

describe Ability do
  context "when no user logged in" do
    let(:ability) { Ability.new(nil) }

    context "UsersController" do
      let(:user) { User.new }

      [:home, :index].each do |action|
        it "should allow #{action}" do
          ability.should be_able_to action, User
        end
      end

      it "should allow show" do
        ability.should be_able_to :show, user
      end

      [:edit, :update, :destroy].each do |action|
        it "should not allow #{action}" do
          ability.should_not be_able_to action, user
        end
      end
    end

    context "ProjectsController" do
      let(:project) { Project.new }

      [:home, :index].each do |action|
        it "should allow #{action}" do
          ability.should be_able_to action, Project
        end
      end

      it "should allow show" do
        ability.should be_able_to :show, project
      end

      [:edit, :update, :destroy].each do |action|
        it "should not allow #{action}" do
          ability.should_not be_able_to action, project
        end
      end
    end
  end

  context "when user logged in" do
    let(:ability) { Ability.new(current_user) }
    let(:current_user) { User.new }

    before do
      current_user.stub(:id).and_return(1)
    end

    context "UsersController" do
      let(:other_user) { User.new }

      before do
        other_user.stub(:id).and_return(2)
      end

      [:edit, :update, :destroy].each do |action|
        it "should allow #{action} on current user" do
          ability.should be_able_to action, current_user
        end

        it "should not allow #{action} on other user" do
          ability.should_not be_able_to action, other_user
        end
      end
    end

    context "ProjectsController" do
      let(:project) { Project.new }

      context "when user is an owner of the project" do
        before do
          current_user.should_receive(:is_owner_of?).with(project).and_return(true)
        end

        [:edit, :update, :destroy].each do |action|
          it "should allow #{action}" do
            ability.should be_able_to action, project
          end
        end
      end

      context "when user is not an owner of the project" do
        before do
          current_user.should_receive(:is_owner_of?).with(project).and_return(false)
        end

        [:edit, :update, :destroy].each do |action|
          it "should not allow #{action}" do
            ability.should_not be_able_to action, project
          end
        end
      end
    end
  end
end
