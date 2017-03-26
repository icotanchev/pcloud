# encoding: utf-8

require File.expand_path('../lib/pcloud/version', __FILE__)

Gem::Specification.new do |s|
  s.name                  = %q{pcloud}
  s.version               = Pcloud::VERSION::CURRENT
  s.date                  = Time.now.strftime('%Y-%m-%d')
  s.authors               = ['Hristo Tanchev']
  s.email                 = ['icotnachev@yahoo.com']
  s.summary               = %q{simple file sync to pcloud.com}
  s.description           = %q{pcloud is a simple file upload to pcloud.com}
  s.license               = 'MIT'
  s.required_ruby_version = '>= 2.2.0'
  s.files                 = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  s.require_paths         = 'lib'

  s.add_dependency 'rest-client', '>= 1.8.0'
end
