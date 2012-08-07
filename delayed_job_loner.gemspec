# -*- encoding: utf-8 -*-
require File.expand_path('../lib/delayed_job_loner/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ian Ehlert"]
  gem.email         = ["ian.ehlert@tstmedia.com"]
  gem.description   = %q{Gem that adds the ability to prevent duplicate delayed jobs from being created.}
  gem.summary       = %q{Adds an option on handle_asynchronously or delay that specifies which attributes to check for uniqueness on. A new job will not be created if one already exists for that method and object.}
  gem.homepage      = "https://github.com/tstmedia/delayed_job_loner"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "delayed_job_loner"
  gem.require_paths = ["lib"]
  gem.version       = DelayedJobLoner::VERSION
end
