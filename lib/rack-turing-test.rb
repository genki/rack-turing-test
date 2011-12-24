require "rack-turing-test/version"

module Rack
  module TuringTest
    PATTERN = Regexp.union( 
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
    ).freeze

    def bot?
      !!user_agent.match(PATTERN)
    end
  end

  class Request
    include TuringTest
  end
end
