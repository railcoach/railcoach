# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'user'

describe User do
  before(:each) do
    @user = users(:edsgerd)
  end

  it "should have a name" do
    user.name.should == 'Edsger Dijkstra'
  end

  it "should have a title" do
    user.title.should == 'Genius'
  end
end
