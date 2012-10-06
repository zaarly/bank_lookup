# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bank_lookup/version"

Gem::Specification.new do |s|
  s.name        = "bank_lookup"
  s.version     = BankLookup::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alex Sharp", "Brent Dillingham"]
  s.email       = ["ajsharp@gmail.com", "brentdillingham@gmail.com"]
  s.homepage    = "https://github.com/zaarly/bank_lookup"
  s.summary     = %q{Lookup bank names by routing number.}
  s.description = %q{Lookup bank names by routing number.}

  s.rubyforge_project = s.name

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'multi_json'
  s.add_dependency 'sinatra'
  s.add_dependency 'activesupport'
end
