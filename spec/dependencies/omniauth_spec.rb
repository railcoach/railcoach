require 'spec_helper'

describe OmniAuth do
  it "shoud return correct full host" do
    env = { 'HTTP_HOST' => 'projectlodge.dev', 'rack.url_scheme' => 'http', 'HTTP_PORT' => '8080', 'HTTP_X_FORWARDED_HOST' => 'projectlodge.org' }
    OmniAuth.config.full_host.call(env).should == 'http://projectlodge.org'
  end
end
