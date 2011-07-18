# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "machinist-caching"
  s.version     = "0.0.1"
  s.authors     = ["Tomas D'Stefano", "Gabriel Sobrinho"]
  s.email       = ["tomas_stefano@successoft.com", "gabriel.sobrinho@gmail.com"]
  s.homepage    = "https://github.com/tomas-stefano/machinist-caching"
  s.summary     = %q{Object caching for machinist}
  s.description = %q{Object caching for machinist}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec', '>= 2.6.0'
  s.add_development_dependency 'activerecord', '>= 3.0'
  s.add_development_dependency 'mysql', '>= 2.8.1'
end
