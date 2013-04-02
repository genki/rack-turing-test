# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack-turing-test/version"

Gem::Specification.new do |s|
  s.name        = "rack-turing-test"
  s.version     = Rack::TuringTest::VERSION
  s.authors     = ["Genki Takiuchi"]
  s.email       = ["genki@s21g.com"]
  s.homepage    = ""
  s.summary     = %q{Bot detector for Rack::Request}
  s.description = %q{You can test if sender of request has intelligence.}

  s.rubyforge_project = "rack-turing-test"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
