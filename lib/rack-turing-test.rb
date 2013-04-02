require "rack-turing-test/version"

module Rack
  module TuringTest
    PATTERN = Regexp.union(*[
      /googlebot/i,
      /mediapartners-google/i,
      /slurp/i,
      /ask.com/i,
      /crawler/i,
      /nutch/i,
      /msnbot/i,
      /bingbot/i,
      /baidu/i,
      /yetibot/i,
      /teoma/i,
      /spider/i,
    ]).freeze

    # Returns true if the request came from bot.
    # Sometimes, there's a case that the HTTP_USERAGENT is nil.
    # It's very rare for ordinary browsers. So, simply we observe it as a bot.
    def bot?
      user_agent.nil? || !!user_agent.match(PATTERN)
    end
  end

  class Request
    include TuringTest
  end
end
