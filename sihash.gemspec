# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sihash/version"

Gem::Specification.new do |spec|
  spec.name          = "sihash"
  spec.version       = Sihash::VERSION
  spec.authors       = ["Jorge Smulevici"]
  spec.email         = ["jsmulevici@gmail.com"]

  spec.summary       = %q{Simple, safe hash operations}
  spec.description   = %q{allows you to perform multikey accesing and safety operations on a hash}
  spec.homepage      = "https://github.com/jorgesmu/sihash"

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
