require 'spec_helper'

describe "organizations/new.html.erb" do
  before(:each) do
    assign(:organization, stub_model(Organization,
      :name => "",
      :description => "",
      :website => "",
      :location => "MyString"
    ).as_new_record)
  end

  it "renders new organization form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => organizations_path, :method => "post" do
      assert_select "input#organization_name", :name => "organization[name]"
      assert_select "input#organization_description", :name => "organization[description]"
      assert_select "input#organization_website", :name => "organization[website]"
      assert_select "input#organization_location", :name => "organization[location]"
    end
  end
end
