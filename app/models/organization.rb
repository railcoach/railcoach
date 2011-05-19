class Organization < ActiveRecord::Base

  def website_url
    url = website
    url = "http://" + website unless website.starts_with?('http://')
    url
  end

  def website_name
    website.sub('http://', '').chomp('/')
  end
end
