require 'spec_helper'

describe "organizations/index.html.erb" do
  before(:each) do
    assign(:organizations, [
      stub_model(Organization,
        :name => "",
        :description => "",
        :website => "",
        :location => "Location"
      ),
      stub_model(Organization,
        :name => "",
        :description => "",
        :website => "",
        :location => "Location"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select ".block > article > h3", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select ".block > article > p", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select ".block > article > aside > a", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select ".block > article > aside", :text => "-\n        Location".to_s, :count => 2
  end
end
