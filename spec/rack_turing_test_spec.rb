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

  it "don't detect requests that the ua is nil as bot affirmatively" do
    req = TestRequest.new nil
    req.bot!.should be_false
  end

  it "can detect googlebot (no ajax)" do
    ua = "Mediapartners-Google"
    req = TestRequest.new ua
    req.should be_bot
    req.bot!.should be_true
  end

  it "can detect googlebot (ajax)" do
    req = TestRequest.new \
      "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
    req.should be_bot
  end
end
