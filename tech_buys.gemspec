# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tech_buys/version'

Gem::Specification.new do |spec|
  spec.name          = "tech_buys"
  spec.version       = TechBuys::VERSION
  spec.authors       = ["parm530"]
  spec.email         = ["parmsahadeo530@gmail.com"]

  spec.summary       = %q{CLI that scrapes electronic devices from BestBuy.com}
  spec.description   = %q{The gem includes electronic devices ranging from laptops to drones and wearable technology. Users are able to browse prices and link to the items that they are interested in purchasing. }
  spec.homepage      = "https://github.com/Olive4Oyl/tech_buys"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
