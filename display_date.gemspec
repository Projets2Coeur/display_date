# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'display_date/version'

Gem::Specification.new do |spec|
  spec.name          = "display_date"
  spec.version       = DisplayDate::VERSION
  spec.authors       = ["Jérémy FRERE"]
  spec.email         = ["frere.jeremy@gmail.com"]

  spec.summary       = %q{Eases the display of event dates in every possible case (one or two date(s), displaying the time or not, on the same day or not).}
  spec.homepage      = "http://www.projets2coeur.fr/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n", "~> 0.7.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rest-client"
  spec.add_development_dependency "dotenv-rails"
  spec.add_development_dependency "mutant"
  spec.add_development_dependency "mutant-rspec"
end
