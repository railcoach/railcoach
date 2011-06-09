require 'spec_helper'
require 'cancan/matchers'

# see also: https://github.com/ryanb/cancan/wiki/Testing-Abilities

describe Ability do
  context "when no user logged in" do
    let(:ability) { Ability.new(nil) }

    context "user" do
      let(:user) { User.new }

      it "should allow home" do
        ability.should be_able_to :home, User
      end

      it "should allow index" do
        ability.should be_able_to :index, User
      end

      it "should allow show" do
        ability.should be_able_to :show, user
      end

      it "should not allow edit" do
        ability.should_not be_able_to :edit, user
      end

      it "should not allow update" do
        ability.should_not be_able_to :update, user
      end
    end
  end
end
