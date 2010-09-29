require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
  end

  it "should not save example" do
    @user.should_not be_valid
  end

end

