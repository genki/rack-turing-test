require File.join(File.dirname(__FILE__), %w[.. lib rack-turing-test])
require 'rspec'

describe Rack::TuringTest do
  class TestRequest
    include Rack::TuringTest

    def initialize(ua) @ua = ua end
    def user_agent; @ua end
  end

  it "should detect New-Sogou-Spider as a bot" do
    ua = "New-Sogou-Spider/1.0 (compatible; MSIE 5.5; Windows 98)"
    req = TestRequest.new ua
    req.should be_bot
  end
end
