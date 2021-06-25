$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'json_truncate/version'

Gem::Specification.new do |s|
    s.name        = 'json_truncate'
    s.license     = 'MIT'
    s.version     = JsonTruncate::VERSION
    s.platform    = Gem::Platform::RUBY
    s.authors     = ['Sean West']
    s.email       = 'sean@digitalshift.ca'
    s.homepage    = 'http://github.com/seanzo/json_truncate'
    s.summary     = %q{Simplify a JSON object for logging purposes.}
    s.description = %q{Truncate any JSON values to a certain length. Truncate to a maximum depth. Truncate to a maximum number of array elements.}
    s.files       = `git ls-files`.split("\n")
end