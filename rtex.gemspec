$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rtex/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rtex"
  s.version     = Rtex::VERSION
  s.authors     = ["Owen Mooney", "Bruce Williams"]
  s.email       = ["omooney@tcd.ie"]
  s.homepage    = "https://github.com/slicedpan/rtex"
  s.summary     = "Summary of Rtex."
  s.description = "Description of Rtex."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.1.0"

  s.add_development_dependency "sqlite3"
end
