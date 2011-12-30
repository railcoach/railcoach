Dynamic::Application.configure do
  config.allowed_networks[:google] = {:method => :open_id, :url => "https://www.google.com/accounts/o8/id" }
  config.allowed_networks[:facebook] = {:method => :facebook}
  config.allowed_networks[:github] = { :method => :github }
  config.allowed_networks[:openid] = { :method => :open_id, :url => "http://www.myopenid.com/affiliate" }
end
