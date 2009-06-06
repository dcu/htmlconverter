# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{htmlconverter}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Cuadrado"]
  s.date = %q{2009-06-06}
  s.default_executable = %q{htmlconverter}
  s.description = %q{Convert HTML to PDF, PS, SVG and PNG}
  s.email = ["krawek@gmail.com"]
  s.executables = ["htmlconverter"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "bin/htmlconverter", "lib/htmlconverter.rb", "lib/htmlconverter/base.rb", "lib/htmlconverter/renderer/base.rb", "lib/htmlconverter/renderer/pdf.rb", "lib/htmlconverter/renderer/ps.rb", "script/console", "test/test_helper.rb", "test/test_htmlconverter.rb"]
  s.homepage = %q{http://github.com/dcu/htmlconverter}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{htmlconverter}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Convert HTML to PDF, PS, SVG and PNG}
  s.test_files = ["test/test_htmlconverter.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.4.1"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
