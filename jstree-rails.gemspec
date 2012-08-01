# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jstree-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Schmitz"]
  gem.email         = ["lydianblues@gmail.com"]
  gem.description   = %q{JSTree for Rails}
  gem.summary       = %q{Packagate JSTree for the Rails asset pipeline}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "jstree-rails"
  gem.require_paths = ["lib"]
  gem.version       = Jstree::Rails::VERSION
end
