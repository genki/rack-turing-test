require File.join(File.dirname(__FILE__), %w[.. lib rack-turing-test])
require 'rspec'

describe Rack::TuringTest do
  class TestRequest
    include Rack::TuringTest

    def initialize(ua) @ua = ua end
    def user_agent; @ua end
  end

  it "should not detect human as a bot" do
    ua = "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0)"
    req = TestRequest.new ua
    req.should_not be_bot
  end

  it "should detect New-Sogou-Spider as a bot" do
    ua = "New-Sogou-Spider/1.0 (compatible; MSIE 5.5; Windows 98)"
    req = TestRequest.new ua
    req.should be_bot
  end

  it "can handle requests that the ua is nil" do
    req = TestRequest.new nil
    req.should be_bot
  end
end
