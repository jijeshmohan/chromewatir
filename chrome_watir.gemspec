Gem::Specification.new do |s|
  s.name = %q{chrome_watir}
  s.version = "1.4.0"

  s.specification_version = 1.2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jijesh Mohan","Sai Venkatakrishnan"]
  s.date = %q{2009-1-21}
  s.description = %q{A watir implementation for Google Chrome.}
  s.email = %q{saidesertrose2004@gmail.com;jijeshmohan@gmail.com}
  libs = Dir.glob(["lib/*.rb","lib/*/*.rb","lib/*/*/*.rb"])
  tests = Dir.glob(["test/*.rb","test/*/*.*","test/*/*/*.*"])
  common_files = Dir.glob("*.rb")
  files = libs << tests << common_files
  s.files = files.flatten
  s.has_rdoc = true
  s.rdoc_options = ["-x", "test","--main","README.rb", "History.rb","License.rb"]
  s.homepage = %q{http://code.google.com/p/chrome-watir/}
  s.require_paths = ["lib","."]
  s.summary = %q{A watir implementation for Google Chrome.}
end