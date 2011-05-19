require 'spec_helper'

describe Organization do
  describe "website_name" do
    before :each do
      @organization = Organization.new
      @organization.website = "http://cool.com/"
    end

    it "should not contain the http protocol" do
      @organization.website_name.should_not match /^http:\/\//
    end

    it "should not contain a trailing slash" do
      @organization.website_name.should_not match /\/$/
    end
  end

  describe "website_url" do
    before :each do
      @organization = Organization.new
      @organization.website = "www.cool.com"
    end

    it "should contain the http protocol" do
      @organization.website_url.should match /^http:\/\//
    end
  end
end
