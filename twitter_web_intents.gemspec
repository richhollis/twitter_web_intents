# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_web_intents/version'

Gem::Specification.new do |spec|
  spec.name          = "twitter_web_intents"
  spec.version       = TwitterWebIntents::VERSION
  spec.authors       = ["Richard Hollis"]
  spec.email         = ["richhollis@gmail.com"]
  spec.description   = %q{Simple helper methods that return Twitter Web Intent URLs}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/richhollis/twitter_web_intents"
  spec.license       = "MIT"

  spec.cert_chain  = ['certs/richhollis.pem']
  spec.signing_key = File.expand_path("~/.gem/private_key.pem") if $0 =~ /gem\z/

  spec.files = %w(LICENSE.txt README.md Rakefile twitter_web_intents.gemspec)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.files += Dir.glob("spec/**/*")

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.test_files     = Dir.glob('spec/**/*')

  spec.add_dependency "activesupport", ['>= 3.0']

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "rspec", "= 3.0.0beta2"
  spec.add_development_dependency "simplecov" if RUBY_VERSION >= '1.9'
  spec.add_development_dependency "coveralls"
  
end
