# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "adhearsion/mongoid/version"

Gem::Specification.new do |s|
  s.name        = "adhearsion-mongoid"
  s.version     = Adhearsion::Mongoid::VERSION
  s.authors     = ["Florent Morin"]
  s.email       = ["florent.morin@morin-innovation.com"]
  s.homepage    = "https://github.com/morin-innovation/adhearsion-mongoid"
  s.summary     = %q{This gem provides an Adhearsion plugin to handle the Mongoid and database integration}
  s.description = %q{This gem provides an Adhearsion plugin to handle the Mongoid and database integration}
  s.license     = "LGPL"

  s.rubyforge_project = "adhearsion-mongoid"

  # Use the following if using Git
  # s.files         = `git ls-files`.split("\n")
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.files         = Dir.glob("{lib}/**/*") + %w( README.md Rakefile Gemfile LICENSE)
  s.test_files    = Dir.glob("{spec}/**/*")
  s.require_paths = ["lib"]

  s.add_runtime_dependency %q<adhearsion>, ["~> 2.4"]
  s.add_runtime_dependency %q<activesupport>, [">= 3.0.10"]
  s.add_runtime_dependency %q<mongoid>, [">= 3.0"]

  s.add_development_dependency %q<bundler>, ["~> 1.0"]
  s.add_development_dependency %q<rspec>, ["~> 2.5"]
  s.add_development_dependency %q<rake>, [">= 0"]
 end
