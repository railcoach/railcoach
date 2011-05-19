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
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
