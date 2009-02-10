# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{redirect}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Petrik de Heus"]
  s.date = %q{2009-02-10}
  s.description = %q{Redirect is a ruby redirect server build on Rack}
  s.email = ["FIX@example.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "example.rb", "lib/redirect.rb", "spec/helper.rb", "spec/rack_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/p8/redirect/tree/master}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{redirect}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Redirect is a ruby redirect server build on Rack}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.3"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.3"])
  end
end
