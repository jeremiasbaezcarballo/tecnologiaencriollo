# -*- encoding: utf-8 -*-
# stub: jekyll-polyglot 1.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-polyglot".freeze
  s.version = "1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 2.7.0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Samuel Volin".freeze]
  s.date = "2022-10-01"
  s.description = "Fast open source i18n plugin for Jekyll blogs.".freeze
  s.email = "untra.sam@gmail.com".freeze
  s.homepage = "https://polyglot.untra.io/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.3.5".freeze
  s.summary = "I18n plugin for Jekyll Blogs".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<jekyll>.freeze, [">= 3.0"])
  else
    s.add_dependency(%q<jekyll>.freeze, [">= 3.0"])
  end
end
