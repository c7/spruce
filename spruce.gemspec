lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'spruce/version'

Gem::Specification.new do |s|
  s.name        = "spruce"
  s.version     = Spruce::VERSION::STRING
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = "Spruce is a Ruby wrapper around the Forrst API"
  s.description = "Spruce is a Ruby wrapper around the Forrst API. " +
                  "The Forrst API is currently a _moving target_ and the " +
                  "plan is to develop Spruce alongside it, as close as possible."
  s.email       = "peter@c7.se"
  s.homepage    = "http://c7.github.com/spruce"
  s.authors     = ["Peter Hellberg"]
  s.licenses    = "MIT-LICENSE"
  
  s.has_rdoc          = true
  s.rdoc_options      = ['--main', 'README.rdoc', '--charset=UTF-8']
  s.extra_rdoc_files  = ['README.rdoc', 'MIT-LICENSE']
  
  s.files             = Dir.glob("{lib}/**/*") + 
                          %w(MIT-LICENSE Rakefile README.rdoc)
  
  s.rubyforge_project = "spruce"
  s.add_dependency('yajl-ruby', '>= 0.7.7')
  s.add_dependency('rest-client', '>= 1.6.0')
end
