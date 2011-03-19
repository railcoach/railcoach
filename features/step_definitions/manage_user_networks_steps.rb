#include Devise::TestHelpers

Given /^I am logged in$/ do
  @user = User.create(:email => "flippo@henkiespenk.nl", :password => "test", :password_confirmation => "test")
  #sign_in @user, :user
end

Then /^I should see a list of connectable networks$/ do
  @user.get_connectable_networks.each do |network|
    within ('#connectableNetworks') do
      page.should contain(network)
    end
  end
end

Given /^I am connected to at least "([^"]*)" network$/ do |arg1|
  # Should be cleaned up
  arg1.to_i.times.each do |n|
    @user.user_tokens << UserToken.new( :provider => ["google", "facebook", "github", "openid" ][n-1])
  end
end

When /^I visit the edit user network page$/ do
  #visit edit_user_network_path(@user.id)
  visit(edit_user_network_path(@user.id))
end

Then /^I should see a list of "([^"]*)" connected networks$/ do |arg1|
  # Should be cleaned up
  @user.get_connect_networks.each do |network|
    within ('#connectedNetworks') do
      page.should contain(network)
    end
  end
end

When /^I click the add network link for "([^"]*)"$/ do |network|
  within("#connectableNetwork_#{network}") do
    click_link 'Connect'
  end
  @user.user_tokens << UserToken.new(:provider => network)
end

Then /^the new "([^"]*)" should be added to my networks$/ do |network|
  visit edit_user_network_path(@user.id)
  within("connectableNetworks") do
    page.should contain(network)
  end
end
