require_relative "lib/yahoo_fantasy_sports/version"

Gem::Specification.new do |s|
  s.name        = "yahoo-fantasy-sports"
  s.version     = YahooFantasySports::VERSION
  s.summary     = "A simple wrapper around the Yahoo Fantasy Sports API"
  s.description = "Authenticate and make requests to the Yahoo Fantasy Sports API"
  s.authors     = ["Scott Lesser"]
  s.email       = "scott@greater.dev"
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = "https://rubygems.org/gems/yahoo-fantasy-sports"
  s.license     = "MIT"

  s.add_dependency 'oauth2', '~> 2.0.9'

  s.add_development_dependency "bundler", "~> 2.3.18"
  s.add_development_dependency "gem-release", "~> 2.2"
  s.add_development_dependency "rake", "~> 13.0"
end