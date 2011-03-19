Given /^I am logged in$/ do
  @user = User.create(:email => "flippo@henkiespenk.nl", :password => "test", :password_confirmation => "test")
  # TODO log user on, else the pages with connectedNetworks/connectableNetworks can not be seen. You can't use 
  #include Devise::TestHelpers and use sign_in :user, @user that will only work in controller specs, not in cucumber tests
end

Then /^I should see a list of connectable networks within a div with id "([^"]*)"$/ do |selector|
  @user.get_connectable_networks.each do |network|
    within "##{selector}" do |content|
      content.should contain(network)
    end
  end
end

Given /^I am connected to at least "([^"]*)" network$/ do |arg1|
  # Should be cleaned up
  arg1.to_i.times.each do |n|
    @user.user_tokens << UserToken.new( :provider => ["google", "facebook", "github", "openid" ][n-1])
  end
end

When /^I visit the 'edit user network' page$/ do
  #visit edit_user_network_path(@user.id)
  visit(edit_user_network_path(:id))
end

Then /^I should see a list of "([^"]*)" connected networks within a div with id "([^"]*)"$/ do |networks, selector|
  # Should be cleaned up
  @user.get_connected_networks.each do |network|
    within "##{selector}" do |content|
      content.should contain(network)
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
  within("#connectableNetworks") do
    page.should contain(network)
  end
end
