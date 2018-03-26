# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-django"
  gem.version       = "1.0.3"
  gem.authors       = ["Kinesis Pty Ltd"]
  gem.email         = ["devs@kinesis.org"]
  gem.description   = %q{Django specific Capistrano tasks}
  gem.summary       = %q{Django specific Capistrano tasks}
  gem.homepage      = "https://github.com/kinesisptyltd/django"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "capistrano", "~> 3.1"
end
