#include Devise::TestHelpers

Given /^I am logged in$/ do
  @user = User.create!(:email => "flippo@henkiespenk.nl", :password => "test123", :password_confirmation => "test123")
  visit new_user_session_path
  within("form#user_new") do
    fill_in 'user_email', :with => @user.email
    fill_in 'user_password', :with => "test123"
    click_button 'Sign in'
  end
end

Then /^I should see a list of connectable networks$/ do
    @user.get_connectable_networks.each do |network|
      page.should have_selector("#connectableNetworks li", :text => network)
  end
end

Given /^I am connected to at least "([^"]*)" network$/ do |arg1|
  # Should be cleaned up
  arg1.to_i.times.each do |n|
    @user.user_tokens << UserToken.new( :provider => ["google", "facebook", "github", "openid" ][n-1])
  end
end

When /^I visit the edit user network page$/ do
  visit(edit_user_network_path(@user.id))
end

Then /^I should see a list of "([^"]*)" connected networks$/ do |networks|
  # Should be cleaned up
  @user.get_connected_networks.each do |network|
    page.should have_selector("#connectedNetworks li", :text => network)
  end
end

When /^I click the add network link for "([^"]*)"$/ do |network|
  within("#connectableNetwork_#{network}") do
    click_link "networkConnect_#{network}"
  end
  @user.user_tokens << UserToken.new(:provider => network)
end

Then /^the new "([^"]*)" should be added to my networks$/ do |network|
  visit edit_user_network_path(@user.id)
  page.should have_selector("#connectedNetworks li", :text => network)
  page.should_not have_selector("connectableNetworks li", :text => network)
end

AfterStep('@pause') do
  print "Press Return to continue"
  STDIN.getc
end
