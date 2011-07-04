# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "machinist-caching/version"

Gem::Specification.new do |s|
  s.name        = "machinist-caching"
  s.version     = Machinist::Caching::VERSION
  s.authors     = ["Tomas D'Stefano"]
  s.email       = ["tomas_stefano@successoft.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "machinist-caching"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'machinist', '~> 2.0.0.beta2'
  s.add_development_dependency 'rspec', '>= 2.6.0'
end
