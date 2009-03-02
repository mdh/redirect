# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{redirect}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Petrik de Heus"]
  s.date = %q{2009-02-24}
  s.default_executable = %q{redirect_app}
  s.description = %q{Redirect is a simple Ruby redirect DSL build on Rack}
  s.email = ["FIX@example.com"]
  s.executables = ["redirect_app"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/redirect_app", "example.rb", "example.ru", "lib/redirect.rb", "spec/helper.rb", "spec/rack_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/p8/redirect/tree/master}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{redirect}
  s.summary = %q{Redirect is a simple Ruby redirect DSL build on Rack}

end
