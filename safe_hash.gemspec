# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "safe_hash/version"

Gem::Specification.new do |spec|
  spec.name          = "safe_hash"
  spec.version       = SafeHash::VERSION
  spec.authors       = ["Jorge Smulevici"]
  spec.email         = ["jsmulevici@gmail.com"]

  spec.summary       = %q{allow safe hashing operations}
  spec.description   = %q{allows you to perform safety operations over a hash without need of keys existing checkings}
  spec.homepage      = "https://github.com/jorgesmu/safe_hash"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
