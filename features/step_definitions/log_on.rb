Given /^I am logged in$/ do
  @user = User.create!(:email => "flippo@henkiespenk.nl", :password => "test123", :password_confirmation => "test123")
  visit new_user_session_path
  within("form#user_new") do
    fill_in 'user_email', :with => @user.email
    fill_in 'user_password', :with => "test123"
    click_button 'Sign in'
  end
end
