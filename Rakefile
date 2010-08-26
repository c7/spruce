require 'rubygems'
gem 'rdoc' # Required on Mac OS X to get a “working” rdoc version
require 'rake/rdoctask'

desc 'Generate RDoc documentation for the spruce gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_files.include('README.rdoc').
    include('lib/**/*.rb').
    exclude('lib/leaf/finders/sequel.rb').
    exclude('lib/leaf/view_helpers/sinatra.rb').
    exclude('lib/leaf/core_ext.rb').
    exclude('lib/leaf/version.rb')
  
  rdoc.main = "README.rdoc" # page to start on
  rdoc.title = "leaf documentation"
  
  rdoc.rdoc_dir = 'doc' # rdoc output folder
  rdoc.options << '--inline-source' << '--charset=UTF-8' << '--format=darkfish'
  rdoc.options << '--main=README.rdoc'
  rdoc.options << '--webcvs=http://github.com/c7/spruce/tree/master/'
end
